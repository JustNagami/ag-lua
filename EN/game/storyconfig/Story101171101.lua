return {
	Play117111001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 117111001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play117111002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "ST03"

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
				local var_4_5 = arg_1_1.bgs_.ST03

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
					if iter_4_0 ~= "ST03" then
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
			local var_4_23 = 0.466666666666667

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
			local var_4_31 = 0.85

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

				local var_4_33 = arg_1_1:GetWordFromCfg(117111001)
				local var_4_34 = arg_1_1:FormatText(var_4_33.content)

				arg_1_1.text_.text = var_4_34

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_35 = 34
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
	Play117111002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 117111002
		arg_7_1.duration_ = 10.966

		local var_7_0 = {
			zh = 10.966,
			ja = 9.533
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
				arg_7_0:Play117111003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = "10035"

			if arg_7_1.actors_[var_10_0] == nil then
				local var_10_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_10_0), arg_7_1.canvasGo_.transform)

				var_10_1.transform:SetSiblingIndex(1)

				var_10_1.name = var_10_0
				var_10_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_7_1.actors_[var_10_0] = var_10_1
			end

			local var_10_2 = arg_7_1.actors_["10035"].transform
			local var_10_3 = 0

			if var_10_3 < arg_7_1.time_ and arg_7_1.time_ <= var_10_3 + arg_10_0 then
				arg_7_1.var_.moveOldPos10035 = var_10_2.localPosition
				var_10_2.localScale = Vector3.New(1, 1, 1)

				arg_7_1:CheckSpriteTmpPos("10035", 2)

				local var_10_4 = var_10_2.childCount

				for iter_10_0 = 0, var_10_4 - 1 do
					local var_10_5 = var_10_2:GetChild(iter_10_0)

					if var_10_5.name == "split_4" or not string.find(var_10_5.name, "split") then
						var_10_5.gameObject:SetActive(true)
					else
						var_10_5.gameObject:SetActive(false)
					end
				end
			end

			local var_10_6 = 0.001

			if var_10_3 <= arg_7_1.time_ and arg_7_1.time_ < var_10_3 + var_10_6 then
				local var_10_7 = (arg_7_1.time_ - var_10_3) / var_10_6
				local var_10_8 = Vector3.New(-390, -410, -235)

				var_10_2.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos10035, var_10_8, var_10_7)
			end

			if arg_7_1.time_ >= var_10_3 + var_10_6 and arg_7_1.time_ < var_10_3 + var_10_6 + arg_10_0 then
				var_10_2.localPosition = Vector3.New(-390, -410, -235)
			end

			local var_10_9 = arg_7_1.actors_["10035"]
			local var_10_10 = 0

			if var_10_10 < arg_7_1.time_ and arg_7_1.time_ <= var_10_10 + arg_10_0 and arg_7_1.var_.actorSpriteComps10035 == nil then
				arg_7_1.var_.actorSpriteComps10035 = var_10_9:GetComponentsInChildren(typeof(Image), true)
			end

			local var_10_11 = 0.2

			if var_10_10 <= arg_7_1.time_ and arg_7_1.time_ < var_10_10 + var_10_11 then
				local var_10_12 = (arg_7_1.time_ - var_10_10) / var_10_11

				if arg_7_1.var_.actorSpriteComps10035 then
					for iter_10_1, iter_10_2 in pairs(arg_7_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_10_2 then
							local var_10_13 = Mathf.Lerp(iter_10_2.color.r, 1, var_10_12)

							iter_10_2.color = Color.New(var_10_13, var_10_13, var_10_13)
						end
					end
				end
			end

			if arg_7_1.time_ >= var_10_10 + var_10_11 and arg_7_1.time_ < var_10_10 + var_10_11 + arg_10_0 and arg_7_1.var_.actorSpriteComps10035 then
				local var_10_14 = 1

				for iter_10_3, iter_10_4 in pairs(arg_7_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_10_4 then
						iter_10_4.color = Color.New(var_10_14, var_10_14, var_10_14)
					end
				end

				arg_7_1.var_.actorSpriteComps10035 = nil
			end

			local var_10_15 = arg_7_1.actors_["10035"]
			local var_10_16 = 0

			if var_10_16 < arg_7_1.time_ and arg_7_1.time_ <= var_10_16 + arg_10_0 then
				local var_10_17 = var_10_15:GetComponentInChildren(typeof(CanvasGroup))

				if var_10_17 then
					arg_7_1.var_.alphaOldValue10035 = var_10_17.alpha
					arg_7_1.var_.characterEffect10035 = var_10_17
				end

				arg_7_1.var_.alphaOldValue10035 = 0
			end

			local var_10_18 = 0.5

			if var_10_16 <= arg_7_1.time_ and arg_7_1.time_ < var_10_16 + var_10_18 then
				local var_10_19 = (arg_7_1.time_ - var_10_16) / var_10_18
				local var_10_20 = Mathf.Lerp(arg_7_1.var_.alphaOldValue10035, 1, var_10_19)

				if arg_7_1.var_.characterEffect10035 then
					arg_7_1.var_.characterEffect10035.alpha = var_10_20
				end
			end

			if arg_7_1.time_ >= var_10_16 + var_10_18 and arg_7_1.time_ < var_10_16 + var_10_18 + arg_10_0 and arg_7_1.var_.characterEffect10035 then
				arg_7_1.var_.characterEffect10035.alpha = 1
			end

			local var_10_21 = "1033"

			if arg_7_1.actors_[var_10_21] == nil then
				local var_10_22 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_10_21), arg_7_1.canvasGo_.transform)

				var_10_22.transform:SetSiblingIndex(1)

				var_10_22.name = var_10_21
				var_10_22.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_7_1.actors_[var_10_21] = var_10_22
			end

			local var_10_23 = arg_7_1.actors_["1033"].transform
			local var_10_24 = 0

			if var_10_24 < arg_7_1.time_ and arg_7_1.time_ <= var_10_24 + arg_10_0 then
				arg_7_1.var_.moveOldPos1033 = var_10_23.localPosition
				var_10_23.localScale = Vector3.New(1, 1, 1)

				arg_7_1:CheckSpriteTmpPos("1033", 4)

				local var_10_25 = var_10_23.childCount

				for iter_10_5 = 0, var_10_25 - 1 do
					local var_10_26 = var_10_23:GetChild(iter_10_5)

					if var_10_26.name == "split_6" or not string.find(var_10_26.name, "split") then
						var_10_26.gameObject:SetActive(true)
					else
						var_10_26.gameObject:SetActive(false)
					end
				end
			end

			local var_10_27 = 0.001

			if var_10_24 <= arg_7_1.time_ and arg_7_1.time_ < var_10_24 + var_10_27 then
				local var_10_28 = (arg_7_1.time_ - var_10_24) / var_10_27
				local var_10_29 = Vector3.New(390, -420, 0)

				var_10_23.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos1033, var_10_29, var_10_28)
			end

			if arg_7_1.time_ >= var_10_24 + var_10_27 and arg_7_1.time_ < var_10_24 + var_10_27 + arg_10_0 then
				var_10_23.localPosition = Vector3.New(390, -420, 0)
			end

			local var_10_30 = arg_7_1.actors_["1033"]
			local var_10_31 = 0

			if var_10_31 < arg_7_1.time_ and arg_7_1.time_ <= var_10_31 + arg_10_0 and arg_7_1.var_.actorSpriteComps1033 == nil then
				arg_7_1.var_.actorSpriteComps1033 = var_10_30:GetComponentsInChildren(typeof(Image), true)
			end

			local var_10_32 = 0.2

			if var_10_31 <= arg_7_1.time_ and arg_7_1.time_ < var_10_31 + var_10_32 then
				local var_10_33 = (arg_7_1.time_ - var_10_31) / var_10_32

				if arg_7_1.var_.actorSpriteComps1033 then
					for iter_10_6, iter_10_7 in pairs(arg_7_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_10_7 then
							local var_10_34 = Mathf.Lerp(iter_10_7.color.r, 0.5, var_10_33)

							iter_10_7.color = Color.New(var_10_34, var_10_34, var_10_34)
						end
					end
				end
			end

			if arg_7_1.time_ >= var_10_31 + var_10_32 and arg_7_1.time_ < var_10_31 + var_10_32 + arg_10_0 and arg_7_1.var_.actorSpriteComps1033 then
				local var_10_35 = 0.5

				for iter_10_8, iter_10_9 in pairs(arg_7_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_10_9 then
						iter_10_9.color = Color.New(var_10_35, var_10_35, var_10_35)
					end
				end

				arg_7_1.var_.actorSpriteComps1033 = nil
			end

			local var_10_36 = arg_7_1.actors_["1033"]
			local var_10_37 = 0

			if var_10_37 < arg_7_1.time_ and arg_7_1.time_ <= var_10_37 + arg_10_0 then
				local var_10_38 = var_10_36:GetComponentInChildren(typeof(CanvasGroup))

				if var_10_38 then
					arg_7_1.var_.alphaOldValue1033 = var_10_38.alpha
					arg_7_1.var_.characterEffect1033 = var_10_38
				end

				arg_7_1.var_.alphaOldValue1033 = 0
			end

			local var_10_39 = 0.5

			if var_10_37 <= arg_7_1.time_ and arg_7_1.time_ < var_10_37 + var_10_39 then
				local var_10_40 = (arg_7_1.time_ - var_10_37) / var_10_39
				local var_10_41 = Mathf.Lerp(arg_7_1.var_.alphaOldValue1033, 1, var_10_40)

				if arg_7_1.var_.characterEffect1033 then
					arg_7_1.var_.characterEffect1033.alpha = var_10_41
				end
			end

			if arg_7_1.time_ >= var_10_37 + var_10_39 and arg_7_1.time_ < var_10_37 + var_10_39 + arg_10_0 and arg_7_1.var_.characterEffect1033 then
				arg_7_1.var_.characterEffect1033.alpha = 1
			end

			local var_10_42 = 0
			local var_10_43 = 1.475

			if var_10_42 < arg_7_1.time_ and arg_7_1.time_ <= var_10_42 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_44 = arg_7_1:FormatText(StoryNameCfg[369].name)

				arg_7_1.leftNameTxt_.text = var_10_44

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_45 = arg_7_1:GetWordFromCfg(117111002)
				local var_10_46 = arg_7_1:FormatText(var_10_45.content)

				arg_7_1.text_.text = var_10_46

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_47 = 59
				local var_10_48 = utf8.len(var_10_46)
				local var_10_49 = var_10_47 <= 0 and var_10_43 or var_10_43 * (var_10_48 / var_10_47)

				if var_10_49 > 0 and var_10_43 < var_10_49 then
					arg_7_1.talkMaxDuration = var_10_49

					if var_10_49 + var_10_42 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_49 + var_10_42
					end
				end

				arg_7_1.text_.text = var_10_46
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117111", "117111002", "story_v_out_117111.awb") ~= 0 then
					local var_10_50 = manager.audio:GetVoiceLength("story_v_out_117111", "117111002", "story_v_out_117111.awb") / 1000

					if var_10_50 + var_10_42 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_50 + var_10_42
					end

					if var_10_45.prefab_name ~= "" and arg_7_1.actors_[var_10_45.prefab_name] ~= nil then
						local var_10_51 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_45.prefab_name].transform, "story_v_out_117111", "117111002", "story_v_out_117111.awb")

						arg_7_1:RecordAudio("117111002", var_10_51)
						arg_7_1:RecordAudio("117111002", var_10_51)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_117111", "117111002", "story_v_out_117111.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_117111", "117111002", "story_v_out_117111.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_52 = math.max(var_10_43, arg_7_1.talkMaxDuration)

			if var_10_42 <= arg_7_1.time_ and arg_7_1.time_ < var_10_42 + var_10_52 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_42) / var_10_52

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_42 + var_10_52 and arg_7_1.time_ < var_10_42 + var_10_52 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play117111003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 117111003
		arg_11_1.duration_ = 9.533

		local var_11_0 = {
			zh = 9.533,
			ja = 6.8
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
				arg_11_0:Play117111004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0
			local var_14_1 = 1.375

			if var_14_0 < arg_11_1.time_ and arg_11_1.time_ <= var_14_0 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_2 = arg_11_1:FormatText(StoryNameCfg[369].name)

				arg_11_1.leftNameTxt_.text = var_14_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_3 = arg_11_1:GetWordFromCfg(117111003)
				local var_14_4 = arg_11_1:FormatText(var_14_3.content)

				arg_11_1.text_.text = var_14_4

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_5 = 56
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

				if manager.audio:GetVoiceLength("story_v_out_117111", "117111003", "story_v_out_117111.awb") ~= 0 then
					local var_14_8 = manager.audio:GetVoiceLength("story_v_out_117111", "117111003", "story_v_out_117111.awb") / 1000

					if var_14_8 + var_14_0 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_8 + var_14_0
					end

					if var_14_3.prefab_name ~= "" and arg_11_1.actors_[var_14_3.prefab_name] ~= nil then
						local var_14_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_3.prefab_name].transform, "story_v_out_117111", "117111003", "story_v_out_117111.awb")

						arg_11_1:RecordAudio("117111003", var_14_9)
						arg_11_1:RecordAudio("117111003", var_14_9)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_117111", "117111003", "story_v_out_117111.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_117111", "117111003", "story_v_out_117111.awb")
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
	Play117111004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 117111004
		arg_15_1.duration_ = 9.2

		local var_15_0 = {
			zh = 8.333,
			ja = 9.2
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
				arg_15_0:Play117111005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = 0
			local var_18_1 = 1.25

			if var_18_0 < arg_15_1.time_ and arg_15_1.time_ <= var_18_0 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_2 = arg_15_1:FormatText(StoryNameCfg[369].name)

				arg_15_1.leftNameTxt_.text = var_18_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_3 = arg_15_1:GetWordFromCfg(117111004)
				local var_18_4 = arg_15_1:FormatText(var_18_3.content)

				arg_15_1.text_.text = var_18_4

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_5 = 50
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

				if manager.audio:GetVoiceLength("story_v_out_117111", "117111004", "story_v_out_117111.awb") ~= 0 then
					local var_18_8 = manager.audio:GetVoiceLength("story_v_out_117111", "117111004", "story_v_out_117111.awb") / 1000

					if var_18_8 + var_18_0 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_8 + var_18_0
					end

					if var_18_3.prefab_name ~= "" and arg_15_1.actors_[var_18_3.prefab_name] ~= nil then
						local var_18_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_3.prefab_name].transform, "story_v_out_117111", "117111004", "story_v_out_117111.awb")

						arg_15_1:RecordAudio("117111004", var_18_9)
						arg_15_1:RecordAudio("117111004", var_18_9)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_117111", "117111004", "story_v_out_117111.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_117111", "117111004", "story_v_out_117111.awb")
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
	Play117111005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 117111005
		arg_19_1.duration_ = 7.766

		local var_19_0 = {
			zh = 5.466,
			ja = 7.766
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
				arg_19_0:Play117111006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["10035"]
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 and arg_19_1.var_.actorSpriteComps10035 == nil then
				arg_19_1.var_.actorSpriteComps10035 = var_22_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_22_2 = 0.2

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2

				if arg_19_1.var_.actorSpriteComps10035 then
					for iter_22_0, iter_22_1 in pairs(arg_19_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_22_1 then
							local var_22_4 = Mathf.Lerp(iter_22_1.color.r, 0.5, var_22_3)

							iter_22_1.color = Color.New(var_22_4, var_22_4, var_22_4)
						end
					end
				end
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 and arg_19_1.var_.actorSpriteComps10035 then
				local var_22_5 = 0.5

				for iter_22_2, iter_22_3 in pairs(arg_19_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_22_3 then
						iter_22_3.color = Color.New(var_22_5, var_22_5, var_22_5)
					end
				end

				arg_19_1.var_.actorSpriteComps10035 = nil
			end

			local var_22_6 = arg_19_1.actors_["1033"]
			local var_22_7 = 0

			if var_22_7 < arg_19_1.time_ and arg_19_1.time_ <= var_22_7 + arg_22_0 and arg_19_1.var_.actorSpriteComps1033 == nil then
				arg_19_1.var_.actorSpriteComps1033 = var_22_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_22_8 = 0.2

			if var_22_7 <= arg_19_1.time_ and arg_19_1.time_ < var_22_7 + var_22_8 then
				local var_22_9 = (arg_19_1.time_ - var_22_7) / var_22_8

				if arg_19_1.var_.actorSpriteComps1033 then
					for iter_22_4, iter_22_5 in pairs(arg_19_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_22_5 then
							local var_22_10 = Mathf.Lerp(iter_22_5.color.r, 1, var_22_9)

							iter_22_5.color = Color.New(var_22_10, var_22_10, var_22_10)
						end
					end
				end
			end

			if arg_19_1.time_ >= var_22_7 + var_22_8 and arg_19_1.time_ < var_22_7 + var_22_8 + arg_22_0 and arg_19_1.var_.actorSpriteComps1033 then
				local var_22_11 = 1

				for iter_22_6, iter_22_7 in pairs(arg_19_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_22_7 then
						iter_22_7.color = Color.New(var_22_11, var_22_11, var_22_11)
					end
				end

				arg_19_1.var_.actorSpriteComps1033 = nil
			end

			local var_22_12 = 0
			local var_22_13 = 0.55

			if var_22_12 < arg_19_1.time_ and arg_19_1.time_ <= var_22_12 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_14 = arg_19_1:FormatText(StoryNameCfg[236].name)

				arg_19_1.leftNameTxt_.text = var_22_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_15 = arg_19_1:GetWordFromCfg(117111005)
				local var_22_16 = arg_19_1:FormatText(var_22_15.content)

				arg_19_1.text_.text = var_22_16

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_17 = 22
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

				if manager.audio:GetVoiceLength("story_v_out_117111", "117111005", "story_v_out_117111.awb") ~= 0 then
					local var_22_20 = manager.audio:GetVoiceLength("story_v_out_117111", "117111005", "story_v_out_117111.awb") / 1000

					if var_22_20 + var_22_12 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_20 + var_22_12
					end

					if var_22_15.prefab_name ~= "" and arg_19_1.actors_[var_22_15.prefab_name] ~= nil then
						local var_22_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_15.prefab_name].transform, "story_v_out_117111", "117111005", "story_v_out_117111.awb")

						arg_19_1:RecordAudio("117111005", var_22_21)
						arg_19_1:RecordAudio("117111005", var_22_21)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_117111", "117111005", "story_v_out_117111.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_117111", "117111005", "story_v_out_117111.awb")
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
	Play117111006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 117111006
		arg_23_1.duration_ = 6.4

		local var_23_0 = {
			zh = 3.333,
			ja = 6.4
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
				arg_23_0:Play117111007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["10035"]
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 and arg_23_1.var_.actorSpriteComps10035 == nil then
				arg_23_1.var_.actorSpriteComps10035 = var_26_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_26_2 = 0.2

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2

				if arg_23_1.var_.actorSpriteComps10035 then
					for iter_26_0, iter_26_1 in pairs(arg_23_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_26_1 then
							local var_26_4 = Mathf.Lerp(iter_26_1.color.r, 1, var_26_3)

							iter_26_1.color = Color.New(var_26_4, var_26_4, var_26_4)
						end
					end
				end
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 and arg_23_1.var_.actorSpriteComps10035 then
				local var_26_5 = 1

				for iter_26_2, iter_26_3 in pairs(arg_23_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_26_3 then
						iter_26_3.color = Color.New(var_26_5, var_26_5, var_26_5)
					end
				end

				arg_23_1.var_.actorSpriteComps10035 = nil
			end

			local var_26_6 = arg_23_1.actors_["1033"]
			local var_26_7 = 0

			if var_26_7 < arg_23_1.time_ and arg_23_1.time_ <= var_26_7 + arg_26_0 and arg_23_1.var_.actorSpriteComps1033 == nil then
				arg_23_1.var_.actorSpriteComps1033 = var_26_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_26_8 = 0.2

			if var_26_7 <= arg_23_1.time_ and arg_23_1.time_ < var_26_7 + var_26_8 then
				local var_26_9 = (arg_23_1.time_ - var_26_7) / var_26_8

				if arg_23_1.var_.actorSpriteComps1033 then
					for iter_26_4, iter_26_5 in pairs(arg_23_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_26_5 then
							local var_26_10 = Mathf.Lerp(iter_26_5.color.r, 0.5, var_26_9)

							iter_26_5.color = Color.New(var_26_10, var_26_10, var_26_10)
						end
					end
				end
			end

			if arg_23_1.time_ >= var_26_7 + var_26_8 and arg_23_1.time_ < var_26_7 + var_26_8 + arg_26_0 and arg_23_1.var_.actorSpriteComps1033 then
				local var_26_11 = 0.5

				for iter_26_6, iter_26_7 in pairs(arg_23_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_26_7 then
						iter_26_7.color = Color.New(var_26_11, var_26_11, var_26_11)
					end
				end

				arg_23_1.var_.actorSpriteComps1033 = nil
			end

			local var_26_12 = 0
			local var_26_13 = 0.3

			if var_26_12 < arg_23_1.time_ and arg_23_1.time_ <= var_26_12 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_14 = arg_23_1:FormatText(StoryNameCfg[369].name)

				arg_23_1.leftNameTxt_.text = var_26_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_15 = arg_23_1:GetWordFromCfg(117111006)
				local var_26_16 = arg_23_1:FormatText(var_26_15.content)

				arg_23_1.text_.text = var_26_16

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_17 = 12
				local var_26_18 = utf8.len(var_26_16)
				local var_26_19 = var_26_17 <= 0 and var_26_13 or var_26_13 * (var_26_18 / var_26_17)

				if var_26_19 > 0 and var_26_13 < var_26_19 then
					arg_23_1.talkMaxDuration = var_26_19

					if var_26_19 + var_26_12 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_19 + var_26_12
					end
				end

				arg_23_1.text_.text = var_26_16
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117111", "117111006", "story_v_out_117111.awb") ~= 0 then
					local var_26_20 = manager.audio:GetVoiceLength("story_v_out_117111", "117111006", "story_v_out_117111.awb") / 1000

					if var_26_20 + var_26_12 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_20 + var_26_12
					end

					if var_26_15.prefab_name ~= "" and arg_23_1.actors_[var_26_15.prefab_name] ~= nil then
						local var_26_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_15.prefab_name].transform, "story_v_out_117111", "117111006", "story_v_out_117111.awb")

						arg_23_1:RecordAudio("117111006", var_26_21)
						arg_23_1:RecordAudio("117111006", var_26_21)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_117111", "117111006", "story_v_out_117111.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_117111", "117111006", "story_v_out_117111.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_22 = math.max(var_26_13, arg_23_1.talkMaxDuration)

			if var_26_12 <= arg_23_1.time_ and arg_23_1.time_ < var_26_12 + var_26_22 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_12) / var_26_22

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_12 + var_26_22 and arg_23_1.time_ < var_26_12 + var_26_22 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play117111007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 117111007
		arg_27_1.duration_ = 5

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play117111008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["10035"]
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 and arg_27_1.var_.actorSpriteComps10035 == nil then
				arg_27_1.var_.actorSpriteComps10035 = var_30_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_30_2 = 0.2

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2

				if arg_27_1.var_.actorSpriteComps10035 then
					for iter_30_0, iter_30_1 in pairs(arg_27_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_30_1 then
							local var_30_4 = Mathf.Lerp(iter_30_1.color.r, 0.5, var_30_3)

							iter_30_1.color = Color.New(var_30_4, var_30_4, var_30_4)
						end
					end
				end
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 and arg_27_1.var_.actorSpriteComps10035 then
				local var_30_5 = 0.5

				for iter_30_2, iter_30_3 in pairs(arg_27_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_30_3 then
						iter_30_3.color = Color.New(var_30_5, var_30_5, var_30_5)
					end
				end

				arg_27_1.var_.actorSpriteComps10035 = nil
			end

			local var_30_6 = 0
			local var_30_7 = 1.375

			if var_30_6 < arg_27_1.time_ and arg_27_1.time_ <= var_30_6 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, false)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_8 = arg_27_1:GetWordFromCfg(117111007)
				local var_30_9 = arg_27_1:FormatText(var_30_8.content)

				arg_27_1.text_.text = var_30_9

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_10 = 55
				local var_30_11 = utf8.len(var_30_9)
				local var_30_12 = var_30_10 <= 0 and var_30_7 or var_30_7 * (var_30_11 / var_30_10)

				if var_30_12 > 0 and var_30_7 < var_30_12 then
					arg_27_1.talkMaxDuration = var_30_12

					if var_30_12 + var_30_6 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_12 + var_30_6
					end
				end

				arg_27_1.text_.text = var_30_9
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)
				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_13 = math.max(var_30_7, arg_27_1.talkMaxDuration)

			if var_30_6 <= arg_27_1.time_ and arg_27_1.time_ < var_30_6 + var_30_13 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_6) / var_30_13

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_6 + var_30_13 and arg_27_1.time_ < var_30_6 + var_30_13 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play117111008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 117111008
		arg_31_1.duration_ = 4.6

		local var_31_0 = {
			zh = 4.3,
			ja = 4.6
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
				arg_31_0:Play117111009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["1033"].transform
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 then
				arg_31_1.var_.moveOldPos1033 = var_34_0.localPosition
				var_34_0.localScale = Vector3.New(1, 1, 1)

				arg_31_1:CheckSpriteTmpPos("1033", 4)

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
				local var_34_6 = Vector3.New(390, -420, 0)

				var_34_0.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPos1033, var_34_6, var_34_5)
			end

			if arg_31_1.time_ >= var_34_1 + var_34_4 and arg_31_1.time_ < var_34_1 + var_34_4 + arg_34_0 then
				var_34_0.localPosition = Vector3.New(390, -420, 0)
			end

			local var_34_7 = arg_31_1.actors_["1033"]
			local var_34_8 = 0

			if var_34_8 < arg_31_1.time_ and arg_31_1.time_ <= var_34_8 + arg_34_0 and arg_31_1.var_.actorSpriteComps1033 == nil then
				arg_31_1.var_.actorSpriteComps1033 = var_34_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_34_9 = 0.0166666666666667

			if var_34_8 <= arg_31_1.time_ and arg_31_1.time_ < var_34_8 + var_34_9 then
				local var_34_10 = (arg_31_1.time_ - var_34_8) / var_34_9

				if arg_31_1.var_.actorSpriteComps1033 then
					for iter_34_1, iter_34_2 in pairs(arg_31_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_34_2 then
							local var_34_11 = Mathf.Lerp(iter_34_2.color.r, 1, var_34_10)

							iter_34_2.color = Color.New(var_34_11, var_34_11, var_34_11)
						end
					end
				end
			end

			if arg_31_1.time_ >= var_34_8 + var_34_9 and arg_31_1.time_ < var_34_8 + var_34_9 + arg_34_0 and arg_31_1.var_.actorSpriteComps1033 then
				local var_34_12 = 1

				for iter_34_3, iter_34_4 in pairs(arg_31_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_34_4 then
						iter_34_4.color = Color.New(var_34_12, var_34_12, var_34_12)
					end
				end

				arg_31_1.var_.actorSpriteComps1033 = nil
			end

			local var_34_13 = 0
			local var_34_14 = 0.55

			if var_34_13 < arg_31_1.time_ and arg_31_1.time_ <= var_34_13 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_15 = arg_31_1:FormatText(StoryNameCfg[236].name)

				arg_31_1.leftNameTxt_.text = var_34_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_16 = arg_31_1:GetWordFromCfg(117111008)
				local var_34_17 = arg_31_1:FormatText(var_34_16.content)

				arg_31_1.text_.text = var_34_17

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_18 = 22
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

				if manager.audio:GetVoiceLength("story_v_out_117111", "117111008", "story_v_out_117111.awb") ~= 0 then
					local var_34_21 = manager.audio:GetVoiceLength("story_v_out_117111", "117111008", "story_v_out_117111.awb") / 1000

					if var_34_21 + var_34_13 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_21 + var_34_13
					end

					if var_34_16.prefab_name ~= "" and arg_31_1.actors_[var_34_16.prefab_name] ~= nil then
						local var_34_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_16.prefab_name].transform, "story_v_out_117111", "117111008", "story_v_out_117111.awb")

						arg_31_1:RecordAudio("117111008", var_34_22)
						arg_31_1:RecordAudio("117111008", var_34_22)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_117111", "117111008", "story_v_out_117111.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_117111", "117111008", "story_v_out_117111.awb")
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
	Play117111009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 117111009
		arg_35_1.duration_ = 3.133

		local var_35_0 = {
			zh = 1.233,
			ja = 3.133
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
				arg_35_0:Play117111010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["10035"]
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 and arg_35_1.var_.actorSpriteComps10035 == nil then
				arg_35_1.var_.actorSpriteComps10035 = var_38_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_38_2 = 0.2

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2

				if arg_35_1.var_.actorSpriteComps10035 then
					for iter_38_0, iter_38_1 in pairs(arg_35_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_38_1 then
							local var_38_4 = Mathf.Lerp(iter_38_1.color.r, 1, var_38_3)

							iter_38_1.color = Color.New(var_38_4, var_38_4, var_38_4)
						end
					end
				end
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 and arg_35_1.var_.actorSpriteComps10035 then
				local var_38_5 = 1

				for iter_38_2, iter_38_3 in pairs(arg_35_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_38_3 then
						iter_38_3.color = Color.New(var_38_5, var_38_5, var_38_5)
					end
				end

				arg_35_1.var_.actorSpriteComps10035 = nil
			end

			local var_38_6 = arg_35_1.actors_["1033"]
			local var_38_7 = 0

			if var_38_7 < arg_35_1.time_ and arg_35_1.time_ <= var_38_7 + arg_38_0 and arg_35_1.var_.actorSpriteComps1033 == nil then
				arg_35_1.var_.actorSpriteComps1033 = var_38_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_38_8 = 0.2

			if var_38_7 <= arg_35_1.time_ and arg_35_1.time_ < var_38_7 + var_38_8 then
				local var_38_9 = (arg_35_1.time_ - var_38_7) / var_38_8

				if arg_35_1.var_.actorSpriteComps1033 then
					for iter_38_4, iter_38_5 in pairs(arg_35_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_38_5 then
							local var_38_10 = Mathf.Lerp(iter_38_5.color.r, 0.5, var_38_9)

							iter_38_5.color = Color.New(var_38_10, var_38_10, var_38_10)
						end
					end
				end
			end

			if arg_35_1.time_ >= var_38_7 + var_38_8 and arg_35_1.time_ < var_38_7 + var_38_8 + arg_38_0 and arg_35_1.var_.actorSpriteComps1033 then
				local var_38_11 = 0.5

				for iter_38_6, iter_38_7 in pairs(arg_35_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_38_7 then
						iter_38_7.color = Color.New(var_38_11, var_38_11, var_38_11)
					end
				end

				arg_35_1.var_.actorSpriteComps1033 = nil
			end

			local var_38_12 = 0
			local var_38_13 = 0.125

			if var_38_12 < arg_35_1.time_ and arg_35_1.time_ <= var_38_12 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_14 = arg_35_1:FormatText(StoryNameCfg[369].name)

				arg_35_1.leftNameTxt_.text = var_38_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_15 = arg_35_1:GetWordFromCfg(117111009)
				local var_38_16 = arg_35_1:FormatText(var_38_15.content)

				arg_35_1.text_.text = var_38_16

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_17 = 5
				local var_38_18 = utf8.len(var_38_16)
				local var_38_19 = var_38_17 <= 0 and var_38_13 or var_38_13 * (var_38_18 / var_38_17)

				if var_38_19 > 0 and var_38_13 < var_38_19 then
					arg_35_1.talkMaxDuration = var_38_19

					if var_38_19 + var_38_12 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_19 + var_38_12
					end
				end

				arg_35_1.text_.text = var_38_16
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117111", "117111009", "story_v_out_117111.awb") ~= 0 then
					local var_38_20 = manager.audio:GetVoiceLength("story_v_out_117111", "117111009", "story_v_out_117111.awb") / 1000

					if var_38_20 + var_38_12 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_20 + var_38_12
					end

					if var_38_15.prefab_name ~= "" and arg_35_1.actors_[var_38_15.prefab_name] ~= nil then
						local var_38_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_15.prefab_name].transform, "story_v_out_117111", "117111009", "story_v_out_117111.awb")

						arg_35_1:RecordAudio("117111009", var_38_21)
						arg_35_1:RecordAudio("117111009", var_38_21)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_117111", "117111009", "story_v_out_117111.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_117111", "117111009", "story_v_out_117111.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_22 = math.max(var_38_13, arg_35_1.talkMaxDuration)

			if var_38_12 <= arg_35_1.time_ and arg_35_1.time_ < var_38_12 + var_38_22 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_12) / var_38_22

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_12 + var_38_22 and arg_35_1.time_ < var_38_12 + var_38_22 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play117111010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 117111010
		arg_39_1.duration_ = 3.966

		local var_39_0 = {
			zh = 3.966,
			ja = 1.8
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
				arg_39_0:Play117111011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["10035"]
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 and arg_39_1.var_.actorSpriteComps10035 == nil then
				arg_39_1.var_.actorSpriteComps10035 = var_42_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_42_2 = 0.2

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2

				if arg_39_1.var_.actorSpriteComps10035 then
					for iter_42_0, iter_42_1 in pairs(arg_39_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_42_1 then
							local var_42_4 = Mathf.Lerp(iter_42_1.color.r, 0.5, var_42_3)

							iter_42_1.color = Color.New(var_42_4, var_42_4, var_42_4)
						end
					end
				end
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 and arg_39_1.var_.actorSpriteComps10035 then
				local var_42_5 = 0.5

				for iter_42_2, iter_42_3 in pairs(arg_39_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_42_3 then
						iter_42_3.color = Color.New(var_42_5, var_42_5, var_42_5)
					end
				end

				arg_39_1.var_.actorSpriteComps10035 = nil
			end

			local var_42_6 = arg_39_1.actors_["1033"]
			local var_42_7 = 0

			if var_42_7 < arg_39_1.time_ and arg_39_1.time_ <= var_42_7 + arg_42_0 and arg_39_1.var_.actorSpriteComps1033 == nil then
				arg_39_1.var_.actorSpriteComps1033 = var_42_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_42_8 = 0.2

			if var_42_7 <= arg_39_1.time_ and arg_39_1.time_ < var_42_7 + var_42_8 then
				local var_42_9 = (arg_39_1.time_ - var_42_7) / var_42_8

				if arg_39_1.var_.actorSpriteComps1033 then
					for iter_42_4, iter_42_5 in pairs(arg_39_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_42_5 then
							local var_42_10 = Mathf.Lerp(iter_42_5.color.r, 1, var_42_9)

							iter_42_5.color = Color.New(var_42_10, var_42_10, var_42_10)
						end
					end
				end
			end

			if arg_39_1.time_ >= var_42_7 + var_42_8 and arg_39_1.time_ < var_42_7 + var_42_8 + arg_42_0 and arg_39_1.var_.actorSpriteComps1033 then
				local var_42_11 = 1

				for iter_42_6, iter_42_7 in pairs(arg_39_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_42_7 then
						iter_42_7.color = Color.New(var_42_11, var_42_11, var_42_11)
					end
				end

				arg_39_1.var_.actorSpriteComps1033 = nil
			end

			local var_42_12 = arg_39_1.actors_["1033"].transform
			local var_42_13 = 0

			if var_42_13 < arg_39_1.time_ and arg_39_1.time_ <= var_42_13 + arg_42_0 then
				arg_39_1.var_.moveOldPos1033 = var_42_12.localPosition
				var_42_12.localScale = Vector3.New(1, 1, 1)

				arg_39_1:CheckSpriteTmpPos("1033", 4)

				local var_42_14 = var_42_12.childCount

				for iter_42_8 = 0, var_42_14 - 1 do
					local var_42_15 = var_42_12:GetChild(iter_42_8)

					if var_42_15.name == "split_6" or not string.find(var_42_15.name, "split") then
						var_42_15.gameObject:SetActive(true)
					else
						var_42_15.gameObject:SetActive(false)
					end
				end
			end

			local var_42_16 = 0.001

			if var_42_13 <= arg_39_1.time_ and arg_39_1.time_ < var_42_13 + var_42_16 then
				local var_42_17 = (arg_39_1.time_ - var_42_13) / var_42_16
				local var_42_18 = Vector3.New(390, -420, 0)

				var_42_12.localPosition = Vector3.Lerp(arg_39_1.var_.moveOldPos1033, var_42_18, var_42_17)
			end

			if arg_39_1.time_ >= var_42_13 + var_42_16 and arg_39_1.time_ < var_42_13 + var_42_16 + arg_42_0 then
				var_42_12.localPosition = Vector3.New(390, -420, 0)
			end

			local var_42_19 = 0
			local var_42_20 = 0.625

			if var_42_19 < arg_39_1.time_ and arg_39_1.time_ <= var_42_19 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_21 = arg_39_1:FormatText(StoryNameCfg[236].name)

				arg_39_1.leftNameTxt_.text = var_42_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_22 = arg_39_1:GetWordFromCfg(117111010)
				local var_42_23 = arg_39_1:FormatText(var_42_22.content)

				arg_39_1.text_.text = var_42_23

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_24 = 25
				local var_42_25 = utf8.len(var_42_23)
				local var_42_26 = var_42_24 <= 0 and var_42_20 or var_42_20 * (var_42_25 / var_42_24)

				if var_42_26 > 0 and var_42_20 < var_42_26 then
					arg_39_1.talkMaxDuration = var_42_26

					if var_42_26 + var_42_19 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_26 + var_42_19
					end
				end

				arg_39_1.text_.text = var_42_23
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117111", "117111010", "story_v_out_117111.awb") ~= 0 then
					local var_42_27 = manager.audio:GetVoiceLength("story_v_out_117111", "117111010", "story_v_out_117111.awb") / 1000

					if var_42_27 + var_42_19 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_27 + var_42_19
					end

					if var_42_22.prefab_name ~= "" and arg_39_1.actors_[var_42_22.prefab_name] ~= nil then
						local var_42_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_22.prefab_name].transform, "story_v_out_117111", "117111010", "story_v_out_117111.awb")

						arg_39_1:RecordAudio("117111010", var_42_28)
						arg_39_1:RecordAudio("117111010", var_42_28)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_117111", "117111010", "story_v_out_117111.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_117111", "117111010", "story_v_out_117111.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_29 = math.max(var_42_20, arg_39_1.talkMaxDuration)

			if var_42_19 <= arg_39_1.time_ and arg_39_1.time_ < var_42_19 + var_42_29 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_19) / var_42_29

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_19 + var_42_29 and arg_39_1.time_ < var_42_19 + var_42_29 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play117111011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 117111011
		arg_43_1.duration_ = 2.5

		local var_43_0 = {
			zh = 2.5,
			ja = 2.333
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
				arg_43_0:Play117111012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["10035"].transform
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 then
				arg_43_1.var_.moveOldPos10035 = var_46_0.localPosition
				var_46_0.localScale = Vector3.New(1, 1, 1)

				arg_43_1:CheckSpriteTmpPos("10035", 2)

				local var_46_2 = var_46_0.childCount

				for iter_46_0 = 0, var_46_2 - 1 do
					local var_46_3 = var_46_0:GetChild(iter_46_0)

					if var_46_3.name == "split_5" or not string.find(var_46_3.name, "split") then
						var_46_3.gameObject:SetActive(true)
					else
						var_46_3.gameObject:SetActive(false)
					end
				end
			end

			local var_46_4 = 0.001

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_4 then
				local var_46_5 = (arg_43_1.time_ - var_46_1) / var_46_4
				local var_46_6 = Vector3.New(-390, -410, -235)

				var_46_0.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos10035, var_46_6, var_46_5)
			end

			if arg_43_1.time_ >= var_46_1 + var_46_4 and arg_43_1.time_ < var_46_1 + var_46_4 + arg_46_0 then
				var_46_0.localPosition = Vector3.New(-390, -410, -235)
			end

			local var_46_7 = arg_43_1.actors_["10035"]
			local var_46_8 = 0

			if var_46_8 < arg_43_1.time_ and arg_43_1.time_ <= var_46_8 + arg_46_0 and arg_43_1.var_.actorSpriteComps10035 == nil then
				arg_43_1.var_.actorSpriteComps10035 = var_46_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_46_9 = 0.2

			if var_46_8 <= arg_43_1.time_ and arg_43_1.time_ < var_46_8 + var_46_9 then
				local var_46_10 = (arg_43_1.time_ - var_46_8) / var_46_9

				if arg_43_1.var_.actorSpriteComps10035 then
					for iter_46_1, iter_46_2 in pairs(arg_43_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_46_2 then
							local var_46_11 = Mathf.Lerp(iter_46_2.color.r, 1, var_46_10)

							iter_46_2.color = Color.New(var_46_11, var_46_11, var_46_11)
						end
					end
				end
			end

			if arg_43_1.time_ >= var_46_8 + var_46_9 and arg_43_1.time_ < var_46_8 + var_46_9 + arg_46_0 and arg_43_1.var_.actorSpriteComps10035 then
				local var_46_12 = 1

				for iter_46_3, iter_46_4 in pairs(arg_43_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_46_4 then
						iter_46_4.color = Color.New(var_46_12, var_46_12, var_46_12)
					end
				end

				arg_43_1.var_.actorSpriteComps10035 = nil
			end

			local var_46_13 = arg_43_1.actors_["1033"]
			local var_46_14 = 0

			if var_46_14 < arg_43_1.time_ and arg_43_1.time_ <= var_46_14 + arg_46_0 and arg_43_1.var_.actorSpriteComps1033 == nil then
				arg_43_1.var_.actorSpriteComps1033 = var_46_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_46_15 = 0.2

			if var_46_14 <= arg_43_1.time_ and arg_43_1.time_ < var_46_14 + var_46_15 then
				local var_46_16 = (arg_43_1.time_ - var_46_14) / var_46_15

				if arg_43_1.var_.actorSpriteComps1033 then
					for iter_46_5, iter_46_6 in pairs(arg_43_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_46_6 then
							local var_46_17 = Mathf.Lerp(iter_46_6.color.r, 0.5, var_46_16)

							iter_46_6.color = Color.New(var_46_17, var_46_17, var_46_17)
						end
					end
				end
			end

			if arg_43_1.time_ >= var_46_14 + var_46_15 and arg_43_1.time_ < var_46_14 + var_46_15 + arg_46_0 and arg_43_1.var_.actorSpriteComps1033 then
				local var_46_18 = 0.5

				for iter_46_7, iter_46_8 in pairs(arg_43_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_46_8 then
						iter_46_8.color = Color.New(var_46_18, var_46_18, var_46_18)
					end
				end

				arg_43_1.var_.actorSpriteComps1033 = nil
			end

			local var_46_19 = 0
			local var_46_20 = 0.225

			if var_46_19 < arg_43_1.time_ and arg_43_1.time_ <= var_46_19 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_21 = arg_43_1:FormatText(StoryNameCfg[369].name)

				arg_43_1.leftNameTxt_.text = var_46_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_22 = arg_43_1:GetWordFromCfg(117111011)
				local var_46_23 = arg_43_1:FormatText(var_46_22.content)

				arg_43_1.text_.text = var_46_23

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_24 = 9
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

				if manager.audio:GetVoiceLength("story_v_out_117111", "117111011", "story_v_out_117111.awb") ~= 0 then
					local var_46_27 = manager.audio:GetVoiceLength("story_v_out_117111", "117111011", "story_v_out_117111.awb") / 1000

					if var_46_27 + var_46_19 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_27 + var_46_19
					end

					if var_46_22.prefab_name ~= "" and arg_43_1.actors_[var_46_22.prefab_name] ~= nil then
						local var_46_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_22.prefab_name].transform, "story_v_out_117111", "117111011", "story_v_out_117111.awb")

						arg_43_1:RecordAudio("117111011", var_46_28)
						arg_43_1:RecordAudio("117111011", var_46_28)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_117111", "117111011", "story_v_out_117111.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_117111", "117111011", "story_v_out_117111.awb")
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
	Play117111012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 117111012
		arg_47_1.duration_ = 5

		SetActive(arg_47_1.tipsGo_, false)

		function arg_47_1.onSingleLineFinish_()
			arg_47_1.onSingleLineUpdate_ = nil
			arg_47_1.onSingleLineFinish_ = nil
			arg_47_1.state_ = "waiting"
		end

		function arg_47_1.playNext_(arg_49_0)
			if arg_49_0 == 1 then
				arg_47_0:Play117111013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["10035"]
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 and arg_47_1.var_.actorSpriteComps10035 == nil then
				arg_47_1.var_.actorSpriteComps10035 = var_50_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_50_2 = 0.2

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2

				if arg_47_1.var_.actorSpriteComps10035 then
					for iter_50_0, iter_50_1 in pairs(arg_47_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_50_1 then
							local var_50_4 = Mathf.Lerp(iter_50_1.color.r, 0.5, var_50_3)

							iter_50_1.color = Color.New(var_50_4, var_50_4, var_50_4)
						end
					end
				end
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 and arg_47_1.var_.actorSpriteComps10035 then
				local var_50_5 = 0.5

				for iter_50_2, iter_50_3 in pairs(arg_47_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_50_3 then
						iter_50_3.color = Color.New(var_50_5, var_50_5, var_50_5)
					end
				end

				arg_47_1.var_.actorSpriteComps10035 = nil
			end

			local var_50_6 = 0
			local var_50_7 = 0.475

			if var_50_6 < arg_47_1.time_ and arg_47_1.time_ <= var_50_6 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, false)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_8 = arg_47_1:GetWordFromCfg(117111012)
				local var_50_9 = arg_47_1:FormatText(var_50_8.content)

				arg_47_1.text_.text = var_50_9

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_10 = 19
				local var_50_11 = utf8.len(var_50_9)
				local var_50_12 = var_50_10 <= 0 and var_50_7 or var_50_7 * (var_50_11 / var_50_10)

				if var_50_12 > 0 and var_50_7 < var_50_12 then
					arg_47_1.talkMaxDuration = var_50_12

					if var_50_12 + var_50_6 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_12 + var_50_6
					end
				end

				arg_47_1.text_.text = var_50_9
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)
				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_13 = math.max(var_50_7, arg_47_1.talkMaxDuration)

			if var_50_6 <= arg_47_1.time_ and arg_47_1.time_ < var_50_6 + var_50_13 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_6) / var_50_13

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_6 + var_50_13 and arg_47_1.time_ < var_50_6 + var_50_13 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play117111013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 117111013
		arg_51_1.duration_ = 12.6

		local var_51_0 = {
			zh = 7.466,
			ja = 12.6
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
				arg_51_0:Play117111014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["10035"].transform
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 then
				arg_51_1.var_.moveOldPos10035 = var_54_0.localPosition
				var_54_0.localScale = Vector3.New(1, 1, 1)

				arg_51_1:CheckSpriteTmpPos("10035", 2)

				local var_54_2 = var_54_0.childCount

				for iter_54_0 = 0, var_54_2 - 1 do
					local var_54_3 = var_54_0:GetChild(iter_54_0)

					if var_54_3.name == "split_4" or not string.find(var_54_3.name, "split") then
						var_54_3.gameObject:SetActive(true)
					else
						var_54_3.gameObject:SetActive(false)
					end
				end
			end

			local var_54_4 = 0.001

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_4 then
				local var_54_5 = (arg_51_1.time_ - var_54_1) / var_54_4
				local var_54_6 = Vector3.New(-390, -410, -235)

				var_54_0.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos10035, var_54_6, var_54_5)
			end

			if arg_51_1.time_ >= var_54_1 + var_54_4 and arg_51_1.time_ < var_54_1 + var_54_4 + arg_54_0 then
				var_54_0.localPosition = Vector3.New(-390, -410, -235)
			end

			local var_54_7 = arg_51_1.actors_["1033"].transform
			local var_54_8 = 0

			if var_54_8 < arg_51_1.time_ and arg_51_1.time_ <= var_54_8 + arg_54_0 then
				arg_51_1.var_.moveOldPos1033 = var_54_7.localPosition
				var_54_7.localScale = Vector3.New(1, 1, 1)

				arg_51_1:CheckSpriteTmpPos("1033", 4)

				local var_54_9 = var_54_7.childCount

				for iter_54_1 = 0, var_54_9 - 1 do
					local var_54_10 = var_54_7:GetChild(iter_54_1)

					if var_54_10.name == "split_6" or not string.find(var_54_10.name, "split") then
						var_54_10.gameObject:SetActive(true)
					else
						var_54_10.gameObject:SetActive(false)
					end
				end
			end

			local var_54_11 = 0.001

			if var_54_8 <= arg_51_1.time_ and arg_51_1.time_ < var_54_8 + var_54_11 then
				local var_54_12 = (arg_51_1.time_ - var_54_8) / var_54_11
				local var_54_13 = Vector3.New(390, -420, 0)

				var_54_7.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos1033, var_54_13, var_54_12)
			end

			if arg_51_1.time_ >= var_54_8 + var_54_11 and arg_51_1.time_ < var_54_8 + var_54_11 + arg_54_0 then
				var_54_7.localPosition = Vector3.New(390, -420, 0)
			end

			local var_54_14 = arg_51_1.actors_["1033"]
			local var_54_15 = 0

			if var_54_15 < arg_51_1.time_ and arg_51_1.time_ <= var_54_15 + arg_54_0 and arg_51_1.var_.actorSpriteComps1033 == nil then
				arg_51_1.var_.actorSpriteComps1033 = var_54_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_54_16 = 0.2

			if var_54_15 <= arg_51_1.time_ and arg_51_1.time_ < var_54_15 + var_54_16 then
				local var_54_17 = (arg_51_1.time_ - var_54_15) / var_54_16

				if arg_51_1.var_.actorSpriteComps1033 then
					for iter_54_2, iter_54_3 in pairs(arg_51_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_54_3 then
							local var_54_18 = Mathf.Lerp(iter_54_3.color.r, 1, var_54_17)

							iter_54_3.color = Color.New(var_54_18, var_54_18, var_54_18)
						end
					end
				end
			end

			if arg_51_1.time_ >= var_54_15 + var_54_16 and arg_51_1.time_ < var_54_15 + var_54_16 + arg_54_0 and arg_51_1.var_.actorSpriteComps1033 then
				local var_54_19 = 1

				for iter_54_4, iter_54_5 in pairs(arg_51_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_54_5 then
						iter_54_5.color = Color.New(var_54_19, var_54_19, var_54_19)
					end
				end

				arg_51_1.var_.actorSpriteComps1033 = nil
			end

			local var_54_20 = 0
			local var_54_21 = 0.925

			if var_54_20 < arg_51_1.time_ and arg_51_1.time_ <= var_54_20 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_22 = arg_51_1:FormatText(StoryNameCfg[236].name)

				arg_51_1.leftNameTxt_.text = var_54_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_23 = arg_51_1:GetWordFromCfg(117111013)
				local var_54_24 = arg_51_1:FormatText(var_54_23.content)

				arg_51_1.text_.text = var_54_24

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_25 = 37
				local var_54_26 = utf8.len(var_54_24)
				local var_54_27 = var_54_25 <= 0 and var_54_21 or var_54_21 * (var_54_26 / var_54_25)

				if var_54_27 > 0 and var_54_21 < var_54_27 then
					arg_51_1.talkMaxDuration = var_54_27

					if var_54_27 + var_54_20 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_27 + var_54_20
					end
				end

				arg_51_1.text_.text = var_54_24
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117111", "117111013", "story_v_out_117111.awb") ~= 0 then
					local var_54_28 = manager.audio:GetVoiceLength("story_v_out_117111", "117111013", "story_v_out_117111.awb") / 1000

					if var_54_28 + var_54_20 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_28 + var_54_20
					end

					if var_54_23.prefab_name ~= "" and arg_51_1.actors_[var_54_23.prefab_name] ~= nil then
						local var_54_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_23.prefab_name].transform, "story_v_out_117111", "117111013", "story_v_out_117111.awb")

						arg_51_1:RecordAudio("117111013", var_54_29)
						arg_51_1:RecordAudio("117111013", var_54_29)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_117111", "117111013", "story_v_out_117111.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_117111", "117111013", "story_v_out_117111.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_30 = math.max(var_54_21, arg_51_1.talkMaxDuration)

			if var_54_20 <= arg_51_1.time_ and arg_51_1.time_ < var_54_20 + var_54_30 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_20) / var_54_30

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_20 + var_54_30 and arg_51_1.time_ < var_54_20 + var_54_30 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play117111014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 117111014
		arg_55_1.duration_ = 5.9

		local var_55_0 = {
			zh = 4.666,
			ja = 5.9
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
				arg_55_0:Play117111015(arg_55_1)
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

				local var_58_2 = arg_55_1:FormatText(StoryNameCfg[236].name)

				arg_55_1.leftNameTxt_.text = var_58_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_3 = arg_55_1:GetWordFromCfg(117111014)
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

				if manager.audio:GetVoiceLength("story_v_out_117111", "117111014", "story_v_out_117111.awb") ~= 0 then
					local var_58_8 = manager.audio:GetVoiceLength("story_v_out_117111", "117111014", "story_v_out_117111.awb") / 1000

					if var_58_8 + var_58_0 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_8 + var_58_0
					end

					if var_58_3.prefab_name ~= "" and arg_55_1.actors_[var_58_3.prefab_name] ~= nil then
						local var_58_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_3.prefab_name].transform, "story_v_out_117111", "117111014", "story_v_out_117111.awb")

						arg_55_1:RecordAudio("117111014", var_58_9)
						arg_55_1:RecordAudio("117111014", var_58_9)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_117111", "117111014", "story_v_out_117111.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_117111", "117111014", "story_v_out_117111.awb")
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
	Play117111015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 117111015
		arg_59_1.duration_ = 4.5

		local var_59_0 = {
			zh = 2.166,
			ja = 4.5
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
				arg_59_0:Play117111016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["1033"].transform
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 then
				arg_59_1.var_.moveOldPos1033 = var_62_0.localPosition
				var_62_0.localScale = Vector3.New(1, 1, 1)

				arg_59_1:CheckSpriteTmpPos("1033", 4)

				local var_62_2 = var_62_0.childCount

				for iter_62_0 = 0, var_62_2 - 1 do
					local var_62_3 = var_62_0:GetChild(iter_62_0)

					if var_62_3.name == "split_6" or not string.find(var_62_3.name, "split") then
						var_62_3.gameObject:SetActive(true)
					else
						var_62_3.gameObject:SetActive(false)
					end
				end
			end

			local var_62_4 = 0.001

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_4 then
				local var_62_5 = (arg_59_1.time_ - var_62_1) / var_62_4
				local var_62_6 = Vector3.New(390, -420, 0)

				var_62_0.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos1033, var_62_6, var_62_5)
			end

			if arg_59_1.time_ >= var_62_1 + var_62_4 and arg_59_1.time_ < var_62_1 + var_62_4 + arg_62_0 then
				var_62_0.localPosition = Vector3.New(390, -420, 0)
			end

			local var_62_7 = arg_59_1.actors_["10035"]
			local var_62_8 = 0

			if var_62_8 < arg_59_1.time_ and arg_59_1.time_ <= var_62_8 + arg_62_0 and arg_59_1.var_.actorSpriteComps10035 == nil then
				arg_59_1.var_.actorSpriteComps10035 = var_62_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_62_9 = 0.2

			if var_62_8 <= arg_59_1.time_ and arg_59_1.time_ < var_62_8 + var_62_9 then
				local var_62_10 = (arg_59_1.time_ - var_62_8) / var_62_9

				if arg_59_1.var_.actorSpriteComps10035 then
					for iter_62_1, iter_62_2 in pairs(arg_59_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_62_2 then
							local var_62_11 = Mathf.Lerp(iter_62_2.color.r, 1, var_62_10)

							iter_62_2.color = Color.New(var_62_11, var_62_11, var_62_11)
						end
					end
				end
			end

			if arg_59_1.time_ >= var_62_8 + var_62_9 and arg_59_1.time_ < var_62_8 + var_62_9 + arg_62_0 and arg_59_1.var_.actorSpriteComps10035 then
				local var_62_12 = 1

				for iter_62_3, iter_62_4 in pairs(arg_59_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_62_4 then
						iter_62_4.color = Color.New(var_62_12, var_62_12, var_62_12)
					end
				end

				arg_59_1.var_.actorSpriteComps10035 = nil
			end

			local var_62_13 = arg_59_1.actors_["1033"]
			local var_62_14 = 0

			if var_62_14 < arg_59_1.time_ and arg_59_1.time_ <= var_62_14 + arg_62_0 and arg_59_1.var_.actorSpriteComps1033 == nil then
				arg_59_1.var_.actorSpriteComps1033 = var_62_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_62_15 = 0.2

			if var_62_14 <= arg_59_1.time_ and arg_59_1.time_ < var_62_14 + var_62_15 then
				local var_62_16 = (arg_59_1.time_ - var_62_14) / var_62_15

				if arg_59_1.var_.actorSpriteComps1033 then
					for iter_62_5, iter_62_6 in pairs(arg_59_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_62_6 then
							local var_62_17 = Mathf.Lerp(iter_62_6.color.r, 0.5, var_62_16)

							iter_62_6.color = Color.New(var_62_17, var_62_17, var_62_17)
						end
					end
				end
			end

			if arg_59_1.time_ >= var_62_14 + var_62_15 and arg_59_1.time_ < var_62_14 + var_62_15 + arg_62_0 and arg_59_1.var_.actorSpriteComps1033 then
				local var_62_18 = 0.5

				for iter_62_7, iter_62_8 in pairs(arg_59_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_62_8 then
						iter_62_8.color = Color.New(var_62_18, var_62_18, var_62_18)
					end
				end

				arg_59_1.var_.actorSpriteComps1033 = nil
			end

			local var_62_19 = 0
			local var_62_20 = 0.15

			if var_62_19 < arg_59_1.time_ and arg_59_1.time_ <= var_62_19 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_21 = arg_59_1:FormatText(StoryNameCfg[369].name)

				arg_59_1.leftNameTxt_.text = var_62_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_22 = arg_59_1:GetWordFromCfg(117111015)
				local var_62_23 = arg_59_1:FormatText(var_62_22.content)

				arg_59_1.text_.text = var_62_23

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_24 = 6
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

				if manager.audio:GetVoiceLength("story_v_out_117111", "117111015", "story_v_out_117111.awb") ~= 0 then
					local var_62_27 = manager.audio:GetVoiceLength("story_v_out_117111", "117111015", "story_v_out_117111.awb") / 1000

					if var_62_27 + var_62_19 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_27 + var_62_19
					end

					if var_62_22.prefab_name ~= "" and arg_59_1.actors_[var_62_22.prefab_name] ~= nil then
						local var_62_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_22.prefab_name].transform, "story_v_out_117111", "117111015", "story_v_out_117111.awb")

						arg_59_1:RecordAudio("117111015", var_62_28)
						arg_59_1:RecordAudio("117111015", var_62_28)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_117111", "117111015", "story_v_out_117111.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_117111", "117111015", "story_v_out_117111.awb")
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
	Play117111016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 117111016
		arg_63_1.duration_ = 5

		SetActive(arg_63_1.tipsGo_, false)

		function arg_63_1.onSingleLineFinish_()
			arg_63_1.onSingleLineUpdate_ = nil
			arg_63_1.onSingleLineFinish_ = nil
			arg_63_1.state_ = "waiting"
		end

		function arg_63_1.playNext_(arg_65_0)
			if arg_65_0 == 1 then
				arg_63_0:Play117111017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["1033"]
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 then
				local var_66_2 = var_66_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_66_2 then
					arg_63_1.var_.alphaOldValue1033 = var_66_2.alpha
					arg_63_1.var_.characterEffect1033 = var_66_2
				end

				arg_63_1.var_.alphaOldValue1033 = 1
			end

			local var_66_3 = 0.5

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_3 then
				local var_66_4 = (arg_63_1.time_ - var_66_1) / var_66_3
				local var_66_5 = Mathf.Lerp(arg_63_1.var_.alphaOldValue1033, 0, var_66_4)

				if arg_63_1.var_.characterEffect1033 then
					arg_63_1.var_.characterEffect1033.alpha = var_66_5
				end
			end

			if arg_63_1.time_ >= var_66_1 + var_66_3 and arg_63_1.time_ < var_66_1 + var_66_3 + arg_66_0 and arg_63_1.var_.characterEffect1033 then
				arg_63_1.var_.characterEffect1033.alpha = 0
			end

			local var_66_6 = arg_63_1.actors_["10035"]
			local var_66_7 = 0

			if var_66_7 < arg_63_1.time_ and arg_63_1.time_ <= var_66_7 + arg_66_0 then
				local var_66_8 = var_66_6:GetComponentInChildren(typeof(CanvasGroup))

				if var_66_8 then
					arg_63_1.var_.alphaOldValue10035 = var_66_8.alpha
					arg_63_1.var_.characterEffect10035 = var_66_8
				end

				arg_63_1.var_.alphaOldValue10035 = 1
			end

			local var_66_9 = 0.5

			if var_66_7 <= arg_63_1.time_ and arg_63_1.time_ < var_66_7 + var_66_9 then
				local var_66_10 = (arg_63_1.time_ - var_66_7) / var_66_9
				local var_66_11 = Mathf.Lerp(arg_63_1.var_.alphaOldValue10035, 0, var_66_10)

				if arg_63_1.var_.characterEffect10035 then
					arg_63_1.var_.characterEffect10035.alpha = var_66_11
				end
			end

			if arg_63_1.time_ >= var_66_7 + var_66_9 and arg_63_1.time_ < var_66_7 + var_66_9 + arg_66_0 and arg_63_1.var_.characterEffect10035 then
				arg_63_1.var_.characterEffect10035.alpha = 0
			end

			local var_66_12 = 0
			local var_66_13 = 0.35

			if var_66_12 < arg_63_1.time_ and arg_63_1.time_ <= var_66_12 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, false)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_14 = arg_63_1:GetWordFromCfg(117111016)
				local var_66_15 = arg_63_1:FormatText(var_66_14.content)

				arg_63_1.text_.text = var_66_15

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_16 = 14
				local var_66_17 = utf8.len(var_66_15)
				local var_66_18 = var_66_16 <= 0 and var_66_13 or var_66_13 * (var_66_17 / var_66_16)

				if var_66_18 > 0 and var_66_13 < var_66_18 then
					arg_63_1.talkMaxDuration = var_66_18

					if var_66_18 + var_66_12 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_18 + var_66_12
					end
				end

				arg_63_1.text_.text = var_66_15
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)
				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_19 = math.max(var_66_13, arg_63_1.talkMaxDuration)

			if var_66_12 <= arg_63_1.time_ and arg_63_1.time_ < var_66_12 + var_66_19 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_12) / var_66_19

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_12 + var_66_19 and arg_63_1.time_ < var_66_12 + var_66_19 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play117111017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 117111017
		arg_67_1.duration_ = 13.666

		local var_67_0 = {
			zh = 9,
			ja = 13.666
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
				arg_67_0:Play117111018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["1033"].transform
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 then
				arg_67_1.var_.moveOldPos1033 = var_70_0.localPosition
				var_70_0.localScale = Vector3.New(1, 1, 1)

				arg_67_1:CheckSpriteTmpPos("1033", 3)

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
				local var_70_6 = Vector3.New(0, -420, 0)

				var_70_0.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos1033, var_70_6, var_70_5)
			end

			if arg_67_1.time_ >= var_70_1 + var_70_4 and arg_67_1.time_ < var_70_1 + var_70_4 + arg_70_0 then
				var_70_0.localPosition = Vector3.New(0, -420, 0)
			end

			local var_70_7 = arg_67_1.actors_["1033"]
			local var_70_8 = 0

			if var_70_8 < arg_67_1.time_ and arg_67_1.time_ <= var_70_8 + arg_70_0 and arg_67_1.var_.actorSpriteComps1033 == nil then
				arg_67_1.var_.actorSpriteComps1033 = var_70_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_70_9 = 0.2

			if var_70_8 <= arg_67_1.time_ and arg_67_1.time_ < var_70_8 + var_70_9 then
				local var_70_10 = (arg_67_1.time_ - var_70_8) / var_70_9

				if arg_67_1.var_.actorSpriteComps1033 then
					for iter_70_1, iter_70_2 in pairs(arg_67_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_70_2 then
							local var_70_11 = Mathf.Lerp(iter_70_2.color.r, 1, var_70_10)

							iter_70_2.color = Color.New(var_70_11, var_70_11, var_70_11)
						end
					end
				end
			end

			if arg_67_1.time_ >= var_70_8 + var_70_9 and arg_67_1.time_ < var_70_8 + var_70_9 + arg_70_0 and arg_67_1.var_.actorSpriteComps1033 then
				local var_70_12 = 1

				for iter_70_3, iter_70_4 in pairs(arg_67_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_70_4 then
						iter_70_4.color = Color.New(var_70_12, var_70_12, var_70_12)
					end
				end

				arg_67_1.var_.actorSpriteComps1033 = nil
			end

			local var_70_13 = arg_67_1.actors_["1033"]
			local var_70_14 = 0

			if var_70_14 < arg_67_1.time_ and arg_67_1.time_ <= var_70_14 + arg_70_0 then
				local var_70_15 = var_70_13:GetComponentInChildren(typeof(CanvasGroup))

				if var_70_15 then
					arg_67_1.var_.alphaOldValue1033 = var_70_15.alpha
					arg_67_1.var_.characterEffect1033 = var_70_15
				end

				arg_67_1.var_.alphaOldValue1033 = 0
			end

			local var_70_16 = 0.5

			if var_70_14 <= arg_67_1.time_ and arg_67_1.time_ < var_70_14 + var_70_16 then
				local var_70_17 = (arg_67_1.time_ - var_70_14) / var_70_16
				local var_70_18 = Mathf.Lerp(arg_67_1.var_.alphaOldValue1033, 1, var_70_17)

				if arg_67_1.var_.characterEffect1033 then
					arg_67_1.var_.characterEffect1033.alpha = var_70_18
				end
			end

			if arg_67_1.time_ >= var_70_14 + var_70_16 and arg_67_1.time_ < var_70_14 + var_70_16 + arg_70_0 and arg_67_1.var_.characterEffect1033 then
				arg_67_1.var_.characterEffect1033.alpha = 1
			end

			local var_70_19 = 0
			local var_70_20 = 1.225

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

				local var_70_22 = arg_67_1:GetWordFromCfg(117111017)
				local var_70_23 = arg_67_1:FormatText(var_70_22.content)

				arg_67_1.text_.text = var_70_23

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_24 = 49
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

				if manager.audio:GetVoiceLength("story_v_out_117111", "117111017", "story_v_out_117111.awb") ~= 0 then
					local var_70_27 = manager.audio:GetVoiceLength("story_v_out_117111", "117111017", "story_v_out_117111.awb") / 1000

					if var_70_27 + var_70_19 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_27 + var_70_19
					end

					if var_70_22.prefab_name ~= "" and arg_67_1.actors_[var_70_22.prefab_name] ~= nil then
						local var_70_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_22.prefab_name].transform, "story_v_out_117111", "117111017", "story_v_out_117111.awb")

						arg_67_1:RecordAudio("117111017", var_70_28)
						arg_67_1:RecordAudio("117111017", var_70_28)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_117111", "117111017", "story_v_out_117111.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_117111", "117111017", "story_v_out_117111.awb")
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
	Play117111018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 117111018
		arg_71_1.duration_ = 2.633

		local var_71_0 = {
			zh = 1.833,
			ja = 2.633
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
			arg_71_1.auto_ = false
		end

		function arg_71_1.playNext_(arg_73_0)
			arg_71_1.onStoryFinished_()
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = 0
			local var_74_1 = 0.2

			if var_74_0 < arg_71_1.time_ and arg_71_1.time_ <= var_74_0 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_2 = arg_71_1:FormatText(StoryNameCfg[236].name)

				arg_71_1.leftNameTxt_.text = var_74_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_3 = arg_71_1:GetWordFromCfg(117111018)
				local var_74_4 = arg_71_1:FormatText(var_74_3.content)

				arg_71_1.text_.text = var_74_4

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_5 = 8
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

				if manager.audio:GetVoiceLength("story_v_out_117111", "117111018", "story_v_out_117111.awb") ~= 0 then
					local var_74_8 = manager.audio:GetVoiceLength("story_v_out_117111", "117111018", "story_v_out_117111.awb") / 1000

					if var_74_8 + var_74_0 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_8 + var_74_0
					end

					if var_74_3.prefab_name ~= "" and arg_71_1.actors_[var_74_3.prefab_name] ~= nil then
						local var_74_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_3.prefab_name].transform, "story_v_out_117111", "117111018", "story_v_out_117111.awb")

						arg_71_1:RecordAudio("117111018", var_74_9)
						arg_71_1:RecordAudio("117111018", var_74_9)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_117111", "117111018", "story_v_out_117111.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_117111", "117111018", "story_v_out_117111.awb")
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
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST03"
	},
	voices = {
		"story_v_out_117111.awb"
	}
}
