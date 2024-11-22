return {
	Play114211001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 114211001
		arg_1_1.duration_ = 7.999999999999

		local var_1_0 = {
			ja = 6.799999999999,
			ko = 7.299999999999,
			zh = 6.199999999999,
			en = 7.999999999999
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
				arg_1_0:Play114211002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "F04"

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
				local var_4_5 = arg_1_1.bgs_.F04

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
					if iter_4_0 ~= "F04" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_16 = 0

			if var_4_16 < arg_1_1.time_ and arg_1_1.time_ <= var_4_16 + arg_4_0 then
				arg_1_1.mask_.enabled = true
				arg_1_1.mask_.raycastTarget = false

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

			local var_4_22 = "10015"

			if arg_1_1.actors_[var_4_22] == nil then
				local var_4_23 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_4_22), arg_1_1.canvasGo_.transform)

				var_4_23.transform:SetSiblingIndex(1)

				var_4_23.name = var_4_22
				var_4_23.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_1_1.actors_[var_4_22] = var_4_23
			end

			local var_4_24 = arg_1_1.actors_["10015"].transform
			local var_4_25 = 1.8

			if var_4_25 < arg_1_1.time_ and arg_1_1.time_ <= var_4_25 + arg_4_0 then
				arg_1_1.var_.moveOldPos10015 = var_4_24.localPosition
				var_4_24.localScale = Vector3.New(1, 1, 1)

				arg_1_1:CheckSpriteTmpPos("10015", 4)

				local var_4_26 = var_4_24.childCount

				for iter_4_2 = 0, var_4_26 - 1 do
					local var_4_27 = var_4_24:GetChild(iter_4_2)

					if var_4_27.name == "split_5" or not string.find(var_4_27.name, "split") then
						var_4_27.gameObject:SetActive(true)
					else
						var_4_27.gameObject:SetActive(false)
					end
				end
			end

			local var_4_28 = 0.001

			if var_4_25 <= arg_1_1.time_ and arg_1_1.time_ < var_4_25 + var_4_28 then
				local var_4_29 = (arg_1_1.time_ - var_4_25) / var_4_28
				local var_4_30 = Vector3.New(390, -350, -180)

				var_4_24.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos10015, var_4_30, var_4_29)
			end

			if arg_1_1.time_ >= var_4_25 + var_4_28 and arg_1_1.time_ < var_4_25 + var_4_28 + arg_4_0 then
				var_4_24.localPosition = Vector3.New(390, -350, -180)
			end

			local var_4_31 = arg_1_1.actors_["10015"]
			local var_4_32 = 1.8

			if var_4_32 < arg_1_1.time_ and arg_1_1.time_ <= var_4_32 + arg_4_0 and arg_1_1.var_.actorSpriteComps10015 == nil then
				arg_1_1.var_.actorSpriteComps10015 = var_4_31:GetComponentsInChildren(typeof(Image), true)
			end

			local var_4_33 = 0.034

			if var_4_32 <= arg_1_1.time_ and arg_1_1.time_ < var_4_32 + var_4_33 then
				local var_4_34 = (arg_1_1.time_ - var_4_32) / var_4_33

				if arg_1_1.var_.actorSpriteComps10015 then
					for iter_4_3, iter_4_4 in pairs(arg_1_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_4_4 then
							local var_4_35 = Mathf.Lerp(iter_4_4.color.r, 1, var_4_34)

							iter_4_4.color = Color.New(var_4_35, var_4_35, var_4_35)
						end
					end
				end
			end

			if arg_1_1.time_ >= var_4_32 + var_4_33 and arg_1_1.time_ < var_4_32 + var_4_33 + arg_4_0 and arg_1_1.var_.actorSpriteComps10015 then
				local var_4_36 = 1

				for iter_4_5, iter_4_6 in pairs(arg_1_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_4_6 then
						iter_4_6.color = Color.New(var_4_36, var_4_36, var_4_36)
					end
				end

				arg_1_1.var_.actorSpriteComps10015 = nil
			end

			local var_4_37 = arg_1_1.actors_["10015"]
			local var_4_38 = 1.8

			if var_4_38 < arg_1_1.time_ and arg_1_1.time_ <= var_4_38 + arg_4_0 then
				local var_4_39 = var_4_37:GetComponentInChildren(typeof(CanvasGroup))

				if var_4_39 then
					arg_1_1.var_.alphaOldValue10015 = var_4_39.alpha
					arg_1_1.var_.characterEffect10015 = var_4_39
				end

				arg_1_1.var_.alphaOldValue10015 = 0
			end

			local var_4_40 = 0.5

			if var_4_38 <= arg_1_1.time_ and arg_1_1.time_ < var_4_38 + var_4_40 then
				local var_4_41 = (arg_1_1.time_ - var_4_38) / var_4_40
				local var_4_42 = Mathf.Lerp(arg_1_1.var_.alphaOldValue10015, 1, var_4_41)

				if arg_1_1.var_.characterEffect10015 then
					arg_1_1.var_.characterEffect10015.alpha = var_4_42
				end
			end

			if arg_1_1.time_ >= var_4_38 + var_4_40 and arg_1_1.time_ < var_4_38 + var_4_40 + arg_4_0 and arg_1_1.var_.characterEffect10015 then
				arg_1_1.var_.characterEffect10015.alpha = 1
			end

			local var_4_43 = 0
			local var_4_44 = 1

			if var_4_43 < arg_1_1.time_ and arg_1_1.time_ <= var_4_43 + arg_4_0 then
				local var_4_45 = "play"
				local var_4_46 = "music"

				arg_1_1:AudioAction(var_4_45, var_4_46, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_47 = 2
			local var_4_48 = 0.966666666666667

			if var_4_47 < arg_1_1.time_ and arg_1_1.time_ <= var_4_47 + arg_4_0 then
				local var_4_49 = "play"
				local var_4_50 = "music"

				arg_1_1:AudioAction(var_4_49, var_4_50, "bgm_activity_1_3_story_outdoor", "bgm_activity_1_3_story_outdoor", "bgm_activity_1_3_story_outdoor.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_51 = 1.999999999999
			local var_4_52 = 0.575

			if var_4_51 < arg_1_1.time_ and arg_1_1.time_ <= var_4_51 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_53 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_53:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_53:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_53:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_54 = arg_1_1:FormatText(StoryNameCfg[208].name)

				arg_1_1.leftNameTxt_.text = var_4_54

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_55 = arg_1_1:GetWordFromCfg(114211001)
				local var_4_56 = arg_1_1:FormatText(var_4_55.content)

				arg_1_1.text_.text = var_4_56

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_57 = 23
				local var_4_58 = utf8.len(var_4_56)
				local var_4_59 = var_4_57 <= 0 and var_4_52 or var_4_52 * (var_4_58 / var_4_57)

				if var_4_59 > 0 and var_4_52 < var_4_59 then
					arg_1_1.talkMaxDuration = var_4_59
					var_4_51 = var_4_51 + 0.3

					if var_4_59 + var_4_51 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_59 + var_4_51
					end
				end

				arg_1_1.text_.text = var_4_56
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114211", "114211001", "story_v_out_114211.awb") ~= 0 then
					local var_4_60 = manager.audio:GetVoiceLength("story_v_out_114211", "114211001", "story_v_out_114211.awb") / 1000

					if var_4_60 + var_4_51 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_60 + var_4_51
					end

					if var_4_55.prefab_name ~= "" and arg_1_1.actors_[var_4_55.prefab_name] ~= nil then
						local var_4_61 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_55.prefab_name].transform, "story_v_out_114211", "114211001", "story_v_out_114211.awb")

						arg_1_1:RecordAudio("114211001", var_4_61)
						arg_1_1:RecordAudio("114211001", var_4_61)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_114211", "114211001", "story_v_out_114211.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_114211", "114211001", "story_v_out_114211.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_62 = var_4_51 + 0.3
			local var_4_63 = math.max(var_4_52, arg_1_1.talkMaxDuration)

			if var_4_62 <= arg_1_1.time_ and arg_1_1.time_ < var_4_62 + var_4_63 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_62) / var_4_63

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_62 + var_4_63 and arg_1_1.time_ < var_4_62 + var_4_63 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play114211002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 114211002
		arg_7_1.duration_ = 7.466

		local var_7_0 = {
			ja = 7.466,
			ko = 5.833,
			zh = 6.133,
			en = 4.9
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
				arg_7_0:Play114211003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = "10017"

			if arg_7_1.actors_[var_10_0] == nil then
				local var_10_1 = Object.Instantiate(arg_7_1.imageGo_, arg_7_1.canvasGo_.transform)

				var_10_1.transform:SetSiblingIndex(1)

				var_10_1.name = var_10_0

				local var_10_2 = var_10_1:GetComponent(typeof(Image))

				var_10_2.sprite = getSpriteWithoutAtlas("TextureConfig/Character/Portrait/" .. var_10_0)

				var_10_2:SetNativeSize()

				var_10_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_7_1.actors_[var_10_0] = var_10_1
			end

			local var_10_3 = arg_7_1.actors_["10017"].transform
			local var_10_4 = 0

			if var_10_4 < arg_7_1.time_ and arg_7_1.time_ <= var_10_4 + arg_10_0 then
				arg_7_1.var_.moveOldPos10017 = var_10_3.localPosition
				var_10_3.localScale = Vector3.New(1, 1, 1)

				arg_7_1:CheckSpriteTmpPos("10017", 2)
			end

			local var_10_5 = 0.001

			if var_10_4 <= arg_7_1.time_ and arg_7_1.time_ < var_10_4 + var_10_5 then
				local var_10_6 = (arg_7_1.time_ - var_10_4) / var_10_5
				local var_10_7 = Vector3.New(-390, -350, -180)

				var_10_3.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos10017, var_10_7, var_10_6)
			end

			if arg_7_1.time_ >= var_10_4 + var_10_5 and arg_7_1.time_ < var_10_4 + var_10_5 + arg_10_0 then
				var_10_3.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_10_8 = arg_7_1.actors_["10017"]
			local var_10_9 = 0

			if var_10_9 < arg_7_1.time_ and arg_7_1.time_ <= var_10_9 + arg_10_0 then
				local var_10_10 = var_10_8:GetComponent("Image")

				if var_10_10 then
					arg_7_1.var_.highlightMatValue10017 = var_10_10
				end
			end

			local var_10_11 = 0.034

			if var_10_9 <= arg_7_1.time_ and arg_7_1.time_ < var_10_9 + var_10_11 then
				local var_10_12 = (arg_7_1.time_ - var_10_9) / var_10_11

				if arg_7_1.var_.highlightMatValue10017 then
					local var_10_13 = Mathf.Lerp(0.5, 1, var_10_12)
					local var_10_14 = arg_7_1.var_.highlightMatValue10017
					local var_10_15 = var_10_14.color

					var_10_15.r = var_10_13
					var_10_15.g = var_10_13
					var_10_15.b = var_10_13
					var_10_14.color = var_10_15
				end
			end

			if arg_7_1.time_ >= var_10_9 + var_10_11 and arg_7_1.time_ < var_10_9 + var_10_11 + arg_10_0 and arg_7_1.var_.highlightMatValue10017 then
				local var_10_16 = 1

				var_10_8.transform:SetSiblingIndex(1)

				local var_10_17 = arg_7_1.var_.highlightMatValue10017
				local var_10_18 = var_10_17.color

				var_10_18.r = var_10_16
				var_10_18.g = var_10_16
				var_10_18.b = var_10_16
				var_10_17.color = var_10_18
			end

			local var_10_19 = arg_7_1.actors_["10015"]
			local var_10_20 = 0

			if var_10_20 < arg_7_1.time_ and arg_7_1.time_ <= var_10_20 + arg_10_0 and arg_7_1.var_.actorSpriteComps10015 == nil then
				arg_7_1.var_.actorSpriteComps10015 = var_10_19:GetComponentsInChildren(typeof(Image), true)
			end

			local var_10_21 = 0.034

			if var_10_20 <= arg_7_1.time_ and arg_7_1.time_ < var_10_20 + var_10_21 then
				local var_10_22 = (arg_7_1.time_ - var_10_20) / var_10_21

				if arg_7_1.var_.actorSpriteComps10015 then
					for iter_10_0, iter_10_1 in pairs(arg_7_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_10_1 then
							local var_10_23 = Mathf.Lerp(iter_10_1.color.r, 0.5, var_10_22)

							iter_10_1.color = Color.New(var_10_23, var_10_23, var_10_23)
						end
					end
				end
			end

			if arg_7_1.time_ >= var_10_20 + var_10_21 and arg_7_1.time_ < var_10_20 + var_10_21 + arg_10_0 and arg_7_1.var_.actorSpriteComps10015 then
				local var_10_24 = 0.5

				for iter_10_2, iter_10_3 in pairs(arg_7_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_10_3 then
						iter_10_3.color = Color.New(var_10_24, var_10_24, var_10_24)
					end
				end

				arg_7_1.var_.actorSpriteComps10015 = nil
			end

			local var_10_25 = arg_7_1.actors_["10017"]
			local var_10_26 = 0

			if var_10_26 < arg_7_1.time_ and arg_7_1.time_ <= var_10_26 + arg_10_0 then
				local var_10_27 = var_10_25:GetComponent("Image")

				if var_10_27 then
					arg_7_1.var_.alphaMatValue10017 = var_10_27
					arg_7_1.var_.alphaOldValue10017 = var_10_27.color.a
				end

				arg_7_1.var_.alphaOldValue10017 = 0
			end

			local var_10_28 = 0.5

			if var_10_26 <= arg_7_1.time_ and arg_7_1.time_ < var_10_26 + var_10_28 then
				local var_10_29 = (arg_7_1.time_ - var_10_26) / var_10_28
				local var_10_30 = Mathf.Lerp(arg_7_1.var_.alphaOldValue10017, 1, var_10_29)

				if arg_7_1.var_.alphaMatValue10017 then
					local var_10_31 = arg_7_1.var_.alphaMatValue10017.color

					var_10_31.a = var_10_30
					arg_7_1.var_.alphaMatValue10017.color = var_10_31
				end
			end

			if arg_7_1.time_ >= var_10_26 + var_10_28 and arg_7_1.time_ < var_10_26 + var_10_28 + arg_10_0 and arg_7_1.var_.alphaMatValue10017 then
				local var_10_32 = arg_7_1.var_.alphaMatValue10017
				local var_10_33 = var_10_32.color

				var_10_33.a = 1
				var_10_32.color = var_10_33
			end

			local var_10_34 = 0
			local var_10_35 = 0.625

			if var_10_34 < arg_7_1.time_ and arg_7_1.time_ <= var_10_34 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_36 = arg_7_1:FormatText(StoryNameCfg[255].name)

				arg_7_1.leftNameTxt_.text = var_10_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_37 = arg_7_1:GetWordFromCfg(114211002)
				local var_10_38 = arg_7_1:FormatText(var_10_37.content)

				arg_7_1.text_.text = var_10_38

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_39 = 25
				local var_10_40 = utf8.len(var_10_38)
				local var_10_41 = var_10_39 <= 0 and var_10_35 or var_10_35 * (var_10_40 / var_10_39)

				if var_10_41 > 0 and var_10_35 < var_10_41 then
					arg_7_1.talkMaxDuration = var_10_41

					if var_10_41 + var_10_34 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_41 + var_10_34
					end
				end

				arg_7_1.text_.text = var_10_38
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114211", "114211002", "story_v_out_114211.awb") ~= 0 then
					local var_10_42 = manager.audio:GetVoiceLength("story_v_out_114211", "114211002", "story_v_out_114211.awb") / 1000

					if var_10_42 + var_10_34 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_42 + var_10_34
					end

					if var_10_37.prefab_name ~= "" and arg_7_1.actors_[var_10_37.prefab_name] ~= nil then
						local var_10_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_37.prefab_name].transform, "story_v_out_114211", "114211002", "story_v_out_114211.awb")

						arg_7_1:RecordAudio("114211002", var_10_43)
						arg_7_1:RecordAudio("114211002", var_10_43)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_114211", "114211002", "story_v_out_114211.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_114211", "114211002", "story_v_out_114211.awb")
				end

				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_44 = math.max(var_10_35, arg_7_1.talkMaxDuration)

			if var_10_34 <= arg_7_1.time_ and arg_7_1.time_ < var_10_34 + var_10_44 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_34) / var_10_44

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_34 + var_10_44 and arg_7_1.time_ < var_10_34 + var_10_44 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play114211003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 114211003
		arg_11_1.duration_ = 5

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play114211004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = arg_11_1.actors_["10017"]
			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 then
				local var_14_2 = var_14_0:GetComponent("Image")

				if var_14_2 then
					arg_11_1.var_.highlightMatValue10017 = var_14_2
				end
			end

			local var_14_3 = 0.034

			if var_14_1 <= arg_11_1.time_ and arg_11_1.time_ < var_14_1 + var_14_3 then
				local var_14_4 = (arg_11_1.time_ - var_14_1) / var_14_3

				if arg_11_1.var_.highlightMatValue10017 then
					local var_14_5 = Mathf.Lerp(1, 0.5, var_14_4)
					local var_14_6 = arg_11_1.var_.highlightMatValue10017
					local var_14_7 = var_14_6.color

					var_14_7.r = var_14_5
					var_14_7.g = var_14_5
					var_14_7.b = var_14_5
					var_14_6.color = var_14_7
				end
			end

			if arg_11_1.time_ >= var_14_1 + var_14_3 and arg_11_1.time_ < var_14_1 + var_14_3 + arg_14_0 and arg_11_1.var_.highlightMatValue10017 then
				local var_14_8 = 0.5
				local var_14_9 = arg_11_1.var_.highlightMatValue10017
				local var_14_10 = var_14_9.color

				var_14_10.r = var_14_8
				var_14_10.g = var_14_8
				var_14_10.b = var_14_8
				var_14_9.color = var_14_10
			end

			local var_14_11 = 0
			local var_14_12 = 0.775

			if var_14_11 < arg_11_1.time_ and arg_11_1.time_ <= var_14_11 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, false)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_13 = arg_11_1:GetWordFromCfg(114211003)
				local var_14_14 = arg_11_1:FormatText(var_14_13.content)

				arg_11_1.text_.text = var_14_14

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_15 = 31
				local var_14_16 = utf8.len(var_14_14)
				local var_14_17 = var_14_15 <= 0 and var_14_12 or var_14_12 * (var_14_16 / var_14_15)

				if var_14_17 > 0 and var_14_12 < var_14_17 then
					arg_11_1.talkMaxDuration = var_14_17

					if var_14_17 + var_14_11 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_17 + var_14_11
					end
				end

				arg_11_1.text_.text = var_14_14
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)
				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_18 = math.max(var_14_12, arg_11_1.talkMaxDuration)

			if var_14_11 <= arg_11_1.time_ and arg_11_1.time_ < var_14_11 + var_14_18 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_11) / var_14_18

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_11 + var_14_18 and arg_11_1.time_ < var_14_11 + var_14_18 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play114211004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 114211004
		arg_15_1.duration_ = 1.733

		local var_15_0 = {
			ja = 1.7,
			ko = 1.566,
			zh = 1.733,
			en = 1
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
				arg_15_0:Play114211005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["10015"]
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 and arg_15_1.var_.actorSpriteComps10015 == nil then
				arg_15_1.var_.actorSpriteComps10015 = var_18_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_18_2 = 0.034

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2

				if arg_15_1.var_.actorSpriteComps10015 then
					for iter_18_0, iter_18_1 in pairs(arg_15_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_18_1 then
							local var_18_4 = Mathf.Lerp(iter_18_1.color.r, 1, var_18_3)

							iter_18_1.color = Color.New(var_18_4, var_18_4, var_18_4)
						end
					end
				end
			end

			if arg_15_1.time_ >= var_18_1 + var_18_2 and arg_15_1.time_ < var_18_1 + var_18_2 + arg_18_0 and arg_15_1.var_.actorSpriteComps10015 then
				local var_18_5 = 1

				for iter_18_2, iter_18_3 in pairs(arg_15_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_18_3 then
						iter_18_3.color = Color.New(var_18_5, var_18_5, var_18_5)
					end
				end

				arg_15_1.var_.actorSpriteComps10015 = nil
			end

			local var_18_6 = 0
			local var_18_7 = 0.05

			if var_18_6 < arg_15_1.time_ and arg_15_1.time_ <= var_18_6 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_8 = arg_15_1:FormatText(StoryNameCfg[208].name)

				arg_15_1.leftNameTxt_.text = var_18_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_9 = arg_15_1:GetWordFromCfg(114211004)
				local var_18_10 = arg_15_1:FormatText(var_18_9.content)

				arg_15_1.text_.text = var_18_10

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_11 = 2
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

				if manager.audio:GetVoiceLength("story_v_out_114211", "114211004", "story_v_out_114211.awb") ~= 0 then
					local var_18_14 = manager.audio:GetVoiceLength("story_v_out_114211", "114211004", "story_v_out_114211.awb") / 1000

					if var_18_14 + var_18_6 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_14 + var_18_6
					end

					if var_18_9.prefab_name ~= "" and arg_15_1.actors_[var_18_9.prefab_name] ~= nil then
						local var_18_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_9.prefab_name].transform, "story_v_out_114211", "114211004", "story_v_out_114211.awb")

						arg_15_1:RecordAudio("114211004", var_18_15)
						arg_15_1:RecordAudio("114211004", var_18_15)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_114211", "114211004", "story_v_out_114211.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_114211", "114211004", "story_v_out_114211.awb")
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
	Play114211005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 114211005
		arg_19_1.duration_ = 5

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play114211006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["10015"]
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 and arg_19_1.var_.actorSpriteComps10015 == nil then
				arg_19_1.var_.actorSpriteComps10015 = var_22_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_22_2 = 0.034

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_2 then
				local var_22_3 = (arg_19_1.time_ - var_22_1) / var_22_2

				if arg_19_1.var_.actorSpriteComps10015 then
					for iter_22_0, iter_22_1 in pairs(arg_19_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_22_1 then
							local var_22_4 = Mathf.Lerp(iter_22_1.color.r, 0.5, var_22_3)

							iter_22_1.color = Color.New(var_22_4, var_22_4, var_22_4)
						end
					end
				end
			end

			if arg_19_1.time_ >= var_22_1 + var_22_2 and arg_19_1.time_ < var_22_1 + var_22_2 + arg_22_0 and arg_19_1.var_.actorSpriteComps10015 then
				local var_22_5 = 0.5

				for iter_22_2, iter_22_3 in pairs(arg_19_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_22_3 then
						iter_22_3.color = Color.New(var_22_5, var_22_5, var_22_5)
					end
				end

				arg_19_1.var_.actorSpriteComps10015 = nil
			end

			local var_22_6 = 0
			local var_22_7 = 0.975

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

				local var_22_8 = arg_19_1:GetWordFromCfg(114211005)
				local var_22_9 = arg_19_1:FormatText(var_22_8.content)

				arg_19_1.text_.text = var_22_9

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_10 = 39
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
	Play114211006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 114211006
		arg_23_1.duration_ = 8.966

		local var_23_0 = {
			ja = 7.533,
			ko = 8.4,
			zh = 8.966,
			en = 7.333
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
				arg_23_0:Play114211007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["10015"]
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 and arg_23_1.var_.actorSpriteComps10015 == nil then
				arg_23_1.var_.actorSpriteComps10015 = var_26_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_26_2 = 0.034

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2

				if arg_23_1.var_.actorSpriteComps10015 then
					for iter_26_0, iter_26_1 in pairs(arg_23_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_26_1 then
							local var_26_4 = Mathf.Lerp(iter_26_1.color.r, 1, var_26_3)

							iter_26_1.color = Color.New(var_26_4, var_26_4, var_26_4)
						end
					end
				end
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 and arg_23_1.var_.actorSpriteComps10015 then
				local var_26_5 = 1

				for iter_26_2, iter_26_3 in pairs(arg_23_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_26_3 then
						iter_26_3.color = Color.New(var_26_5, var_26_5, var_26_5)
					end
				end

				arg_23_1.var_.actorSpriteComps10015 = nil
			end

			local var_26_6 = 0
			local var_26_7 = 1.2

			if var_26_6 < arg_23_1.time_ and arg_23_1.time_ <= var_26_6 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_8 = arg_23_1:FormatText(StoryNameCfg[208].name)

				arg_23_1.leftNameTxt_.text = var_26_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_9 = arg_23_1:GetWordFromCfg(114211006)
				local var_26_10 = arg_23_1:FormatText(var_26_9.content)

				arg_23_1.text_.text = var_26_10

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_11 = 48
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

				if manager.audio:GetVoiceLength("story_v_out_114211", "114211006", "story_v_out_114211.awb") ~= 0 then
					local var_26_14 = manager.audio:GetVoiceLength("story_v_out_114211", "114211006", "story_v_out_114211.awb") / 1000

					if var_26_14 + var_26_6 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_14 + var_26_6
					end

					if var_26_9.prefab_name ~= "" and arg_23_1.actors_[var_26_9.prefab_name] ~= nil then
						local var_26_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_9.prefab_name].transform, "story_v_out_114211", "114211006", "story_v_out_114211.awb")

						arg_23_1:RecordAudio("114211006", var_26_15)
						arg_23_1:RecordAudio("114211006", var_26_15)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_114211", "114211006", "story_v_out_114211.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_114211", "114211006", "story_v_out_114211.awb")
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
	Play114211007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 114211007
		arg_27_1.duration_ = 9.1

		local var_27_0 = {
			ja = 6.833,
			ko = 9.1,
			zh = 7.733,
			en = 7.3
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
				arg_27_0:Play114211008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["10015"]
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 and arg_27_1.var_.actorSpriteComps10015 == nil then
				arg_27_1.var_.actorSpriteComps10015 = var_30_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_30_2 = 0.034

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2

				if arg_27_1.var_.actorSpriteComps10015 then
					for iter_30_0, iter_30_1 in pairs(arg_27_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_30_1 then
							local var_30_4 = Mathf.Lerp(iter_30_1.color.r, 0.5, var_30_3)

							iter_30_1.color = Color.New(var_30_4, var_30_4, var_30_4)
						end
					end
				end
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 and arg_27_1.var_.actorSpriteComps10015 then
				local var_30_5 = 0.5

				for iter_30_2, iter_30_3 in pairs(arg_27_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_30_3 then
						iter_30_3.color = Color.New(var_30_5, var_30_5, var_30_5)
					end
				end

				arg_27_1.var_.actorSpriteComps10015 = nil
			end

			local var_30_6 = 0
			local var_30_7 = 0.95

			if var_30_6 < arg_27_1.time_ and arg_27_1.time_ <= var_30_6 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_8 = arg_27_1:FormatText(StoryNameCfg[210].name)

				arg_27_1.leftNameTxt_.text = var_30_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, true)
				arg_27_1.iconController_:SetSelectedState("hero")

				arg_27_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2050")

				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_9 = arg_27_1:GetWordFromCfg(114211007)
				local var_30_10 = arg_27_1:FormatText(var_30_9.content)

				arg_27_1.text_.text = var_30_10

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_11 = 38
				local var_30_12 = utf8.len(var_30_10)
				local var_30_13 = var_30_11 <= 0 and var_30_7 or var_30_7 * (var_30_12 / var_30_11)

				if var_30_13 > 0 and var_30_7 < var_30_13 then
					arg_27_1.talkMaxDuration = var_30_13

					if var_30_13 + var_30_6 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_13 + var_30_6
					end
				end

				arg_27_1.text_.text = var_30_10
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114211", "114211007", "story_v_out_114211.awb") ~= 0 then
					local var_30_14 = manager.audio:GetVoiceLength("story_v_out_114211", "114211007", "story_v_out_114211.awb") / 1000

					if var_30_14 + var_30_6 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_14 + var_30_6
					end

					if var_30_9.prefab_name ~= "" and arg_27_1.actors_[var_30_9.prefab_name] ~= nil then
						local var_30_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_9.prefab_name].transform, "story_v_out_114211", "114211007", "story_v_out_114211.awb")

						arg_27_1:RecordAudio("114211007", var_30_15)
						arg_27_1:RecordAudio("114211007", var_30_15)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_114211", "114211007", "story_v_out_114211.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_114211", "114211007", "story_v_out_114211.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_16 = math.max(var_30_7, arg_27_1.talkMaxDuration)

			if var_30_6 <= arg_27_1.time_ and arg_27_1.time_ < var_30_6 + var_30_16 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_6) / var_30_16

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_6 + var_30_16 and arg_27_1.time_ < var_30_6 + var_30_16 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play114211008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 114211008
		arg_31_1.duration_ = 6.4

		local var_31_0 = {
			ja = 6.4,
			ko = 4.166,
			zh = 4.366,
			en = 3.533
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
				arg_31_0:Play114211009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = 0
			local var_34_1 = 0.575

			if var_34_0 < arg_31_1.time_ and arg_31_1.time_ <= var_34_0 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_2 = arg_31_1:FormatText(StoryNameCfg[213].name)

				arg_31_1.leftNameTxt_.text = var_34_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, true)
				arg_31_1.iconController_:SetSelectedState("hero")

				arg_31_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2050")

				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_3 = arg_31_1:GetWordFromCfg(114211008)
				local var_34_4 = arg_31_1:FormatText(var_34_3.content)

				arg_31_1.text_.text = var_34_4

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_5 = 23
				local var_34_6 = utf8.len(var_34_4)
				local var_34_7 = var_34_5 <= 0 and var_34_1 or var_34_1 * (var_34_6 / var_34_5)

				if var_34_7 > 0 and var_34_1 < var_34_7 then
					arg_31_1.talkMaxDuration = var_34_7

					if var_34_7 + var_34_0 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_7 + var_34_0
					end
				end

				arg_31_1.text_.text = var_34_4
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114211", "114211008", "story_v_out_114211.awb") ~= 0 then
					local var_34_8 = manager.audio:GetVoiceLength("story_v_out_114211", "114211008", "story_v_out_114211.awb") / 1000

					if var_34_8 + var_34_0 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_8 + var_34_0
					end

					if var_34_3.prefab_name ~= "" and arg_31_1.actors_[var_34_3.prefab_name] ~= nil then
						local var_34_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_3.prefab_name].transform, "story_v_out_114211", "114211008", "story_v_out_114211.awb")

						arg_31_1:RecordAudio("114211008", var_34_9)
						arg_31_1:RecordAudio("114211008", var_34_9)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_114211", "114211008", "story_v_out_114211.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_114211", "114211008", "story_v_out_114211.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_10 = math.max(var_34_1, arg_31_1.talkMaxDuration)

			if var_34_0 <= arg_31_1.time_ and arg_31_1.time_ < var_34_0 + var_34_10 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_0) / var_34_10

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_0 + var_34_10 and arg_31_1.time_ < var_34_0 + var_34_10 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play114211009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 114211009
		arg_35_1.duration_ = 7.733

		local var_35_0 = {
			ja = 6.033,
			ko = 6.8,
			zh = 7.6,
			en = 7.733
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
				arg_35_0:Play114211010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = 0
			local var_38_1 = 0.85

			if var_38_0 < arg_35_1.time_ and arg_35_1.time_ <= var_38_0 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_2 = arg_35_1:FormatText(StoryNameCfg[209].name)

				arg_35_1.leftNameTxt_.text = var_38_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, true)
				arg_35_1.iconController_:SetSelectedState("hero")

				arg_35_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2050")

				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_3 = arg_35_1:GetWordFromCfg(114211009)
				local var_38_4 = arg_35_1:FormatText(var_38_3.content)

				arg_35_1.text_.text = var_38_4

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_5 = 34
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

				if manager.audio:GetVoiceLength("story_v_out_114211", "114211009", "story_v_out_114211.awb") ~= 0 then
					local var_38_8 = manager.audio:GetVoiceLength("story_v_out_114211", "114211009", "story_v_out_114211.awb") / 1000

					if var_38_8 + var_38_0 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_8 + var_38_0
					end

					if var_38_3.prefab_name ~= "" and arg_35_1.actors_[var_38_3.prefab_name] ~= nil then
						local var_38_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_3.prefab_name].transform, "story_v_out_114211", "114211009", "story_v_out_114211.awb")

						arg_35_1:RecordAudio("114211009", var_38_9)
						arg_35_1:RecordAudio("114211009", var_38_9)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_114211", "114211009", "story_v_out_114211.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_114211", "114211009", "story_v_out_114211.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_10 = math.max(var_38_1, arg_35_1.talkMaxDuration)

			if var_38_0 <= arg_35_1.time_ and arg_35_1.time_ < var_38_0 + var_38_10 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_0) / var_38_10

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_0 + var_38_10 and arg_35_1.time_ < var_38_0 + var_38_10 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play114211010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 114211010
		arg_39_1.duration_ = 1.8

		local var_39_0 = {
			ja = 0.999999999999,
			ko = 1.733,
			zh = 1.8,
			en = 1.533
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
				arg_39_0:Play114211011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["10017"]
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 then
				local var_42_2 = var_42_0:GetComponent("Image")

				if var_42_2 then
					arg_39_1.var_.highlightMatValue10017 = var_42_2
				end
			end

			local var_42_3 = 0.034

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_3 then
				local var_42_4 = (arg_39_1.time_ - var_42_1) / var_42_3

				if arg_39_1.var_.highlightMatValue10017 then
					local var_42_5 = Mathf.Lerp(0.5, 1, var_42_4)
					local var_42_6 = arg_39_1.var_.highlightMatValue10017
					local var_42_7 = var_42_6.color

					var_42_7.r = var_42_5
					var_42_7.g = var_42_5
					var_42_7.b = var_42_5
					var_42_6.color = var_42_7
				end
			end

			if arg_39_1.time_ >= var_42_1 + var_42_3 and arg_39_1.time_ < var_42_1 + var_42_3 + arg_42_0 and arg_39_1.var_.highlightMatValue10017 then
				local var_42_8 = 1

				var_42_0.transform:SetSiblingIndex(1)

				local var_42_9 = arg_39_1.var_.highlightMatValue10017
				local var_42_10 = var_42_9.color

				var_42_10.r = var_42_8
				var_42_10.g = var_42_8
				var_42_10.b = var_42_8
				var_42_9.color = var_42_10
			end

			local var_42_11 = 0
			local var_42_12 = 0.05

			if var_42_11 < arg_39_1.time_ and arg_39_1.time_ <= var_42_11 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_13 = arg_39_1:FormatText(StoryNameCfg[255].name)

				arg_39_1.leftNameTxt_.text = var_42_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_14 = arg_39_1:GetWordFromCfg(114211010)
				local var_42_15 = arg_39_1:FormatText(var_42_14.content)

				arg_39_1.text_.text = var_42_15

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_16 = 2
				local var_42_17 = utf8.len(var_42_15)
				local var_42_18 = var_42_16 <= 0 and var_42_12 or var_42_12 * (var_42_17 / var_42_16)

				if var_42_18 > 0 and var_42_12 < var_42_18 then
					arg_39_1.talkMaxDuration = var_42_18

					if var_42_18 + var_42_11 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_18 + var_42_11
					end
				end

				arg_39_1.text_.text = var_42_15
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114211", "114211010", "story_v_out_114211.awb") ~= 0 then
					local var_42_19 = manager.audio:GetVoiceLength("story_v_out_114211", "114211010", "story_v_out_114211.awb") / 1000

					if var_42_19 + var_42_11 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_19 + var_42_11
					end

					if var_42_14.prefab_name ~= "" and arg_39_1.actors_[var_42_14.prefab_name] ~= nil then
						local var_42_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_14.prefab_name].transform, "story_v_out_114211", "114211010", "story_v_out_114211.awb")

						arg_39_1:RecordAudio("114211010", var_42_20)
						arg_39_1:RecordAudio("114211010", var_42_20)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_114211", "114211010", "story_v_out_114211.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_114211", "114211010", "story_v_out_114211.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_21 = math.max(var_42_12, arg_39_1.talkMaxDuration)

			if var_42_11 <= arg_39_1.time_ and arg_39_1.time_ < var_42_11 + var_42_21 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_11) / var_42_21

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_11 + var_42_21 and arg_39_1.time_ < var_42_11 + var_42_21 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play114211011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 114211011
		arg_43_1.duration_ = 5

		SetActive(arg_43_1.tipsGo_, false)

		function arg_43_1.onSingleLineFinish_()
			arg_43_1.onSingleLineUpdate_ = nil
			arg_43_1.onSingleLineFinish_ = nil
			arg_43_1.state_ = "waiting"
		end

		function arg_43_1.playNext_(arg_45_0)
			if arg_45_0 == 1 then
				arg_43_0:Play114211012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["10017"]
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 then
				local var_46_2 = var_46_0:GetComponent("Image")

				if var_46_2 then
					arg_43_1.var_.alphaMatValue10017 = var_46_2
					arg_43_1.var_.alphaOldValue10017 = var_46_2.color.a
				end

				arg_43_1.var_.alphaOldValue10017 = 1
			end

			local var_46_3 = 0.5

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_3 then
				local var_46_4 = (arg_43_1.time_ - var_46_1) / var_46_3
				local var_46_5 = Mathf.Lerp(arg_43_1.var_.alphaOldValue10017, 0, var_46_4)

				if arg_43_1.var_.alphaMatValue10017 then
					local var_46_6 = arg_43_1.var_.alphaMatValue10017.color

					var_46_6.a = var_46_5
					arg_43_1.var_.alphaMatValue10017.color = var_46_6
				end
			end

			if arg_43_1.time_ >= var_46_1 + var_46_3 and arg_43_1.time_ < var_46_1 + var_46_3 + arg_46_0 and arg_43_1.var_.alphaMatValue10017 then
				local var_46_7 = arg_43_1.var_.alphaMatValue10017
				local var_46_8 = var_46_7.color

				var_46_8.a = 0
				var_46_7.color = var_46_8
			end

			local var_46_9 = arg_43_1.actors_["10015"]
			local var_46_10 = 0

			if var_46_10 < arg_43_1.time_ and arg_43_1.time_ <= var_46_10 + arg_46_0 then
				local var_46_11 = var_46_9:GetComponentInChildren(typeof(CanvasGroup))

				if var_46_11 then
					arg_43_1.var_.alphaOldValue10015 = var_46_11.alpha
					arg_43_1.var_.characterEffect10015 = var_46_11
				end

				arg_43_1.var_.alphaOldValue10015 = 1
			end

			local var_46_12 = 0.5

			if var_46_10 <= arg_43_1.time_ and arg_43_1.time_ < var_46_10 + var_46_12 then
				local var_46_13 = (arg_43_1.time_ - var_46_10) / var_46_12
				local var_46_14 = Mathf.Lerp(arg_43_1.var_.alphaOldValue10015, 0, var_46_13)

				if arg_43_1.var_.characterEffect10015 then
					arg_43_1.var_.characterEffect10015.alpha = var_46_14
				end
			end

			if arg_43_1.time_ >= var_46_10 + var_46_12 and arg_43_1.time_ < var_46_10 + var_46_12 + arg_46_0 and arg_43_1.var_.characterEffect10015 then
				arg_43_1.var_.characterEffect10015.alpha = 0
			end

			local var_46_15 = 0
			local var_46_16 = 0.55

			if var_46_15 < arg_43_1.time_ and arg_43_1.time_ <= var_46_15 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, false)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_17 = arg_43_1:GetWordFromCfg(114211011)
				local var_46_18 = arg_43_1:FormatText(var_46_17.content)

				arg_43_1.text_.text = var_46_18

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_19 = 22
				local var_46_20 = utf8.len(var_46_18)
				local var_46_21 = var_46_19 <= 0 and var_46_16 or var_46_16 * (var_46_20 / var_46_19)

				if var_46_21 > 0 and var_46_16 < var_46_21 then
					arg_43_1.talkMaxDuration = var_46_21

					if var_46_21 + var_46_15 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_21 + var_46_15
					end
				end

				arg_43_1.text_.text = var_46_18
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)
				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_22 = math.max(var_46_16, arg_43_1.talkMaxDuration)

			if var_46_15 <= arg_43_1.time_ and arg_43_1.time_ < var_46_15 + var_46_22 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_15) / var_46_22

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_15 + var_46_22 and arg_43_1.time_ < var_46_15 + var_46_22 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play114211012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 114211012
		arg_47_1.duration_ = 5

		SetActive(arg_47_1.tipsGo_, false)

		function arg_47_1.onSingleLineFinish_()
			arg_47_1.onSingleLineUpdate_ = nil
			arg_47_1.onSingleLineFinish_ = nil
			arg_47_1.state_ = "waiting"
		end

		function arg_47_1.playNext_(arg_49_0)
			if arg_49_0 == 1 then
				arg_47_0:Play114211013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = 0
			local var_50_1 = 0.9

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

				local var_50_2 = arg_47_1:GetWordFromCfg(114211012)
				local var_50_3 = arg_47_1:FormatText(var_50_2.content)

				arg_47_1.text_.text = var_50_3

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_4 = 36
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
	Play114211013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 114211013
		arg_51_1.duration_ = 6.9

		local var_51_0 = {
			ja = 6.9,
			ko = 4.933,
			zh = 4.6,
			en = 5.2
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
				arg_51_0:Play114211014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = "10022"

			if arg_51_1.actors_[var_54_0] == nil then
				local var_54_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_54_0), arg_51_1.canvasGo_.transform)

				var_54_1.transform:SetSiblingIndex(1)

				var_54_1.name = var_54_0
				var_54_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_51_1.actors_[var_54_0] = var_54_1
			end

			local var_54_2 = arg_51_1.actors_["10022"].transform
			local var_54_3 = 0

			if var_54_3 < arg_51_1.time_ and arg_51_1.time_ <= var_54_3 + arg_54_0 then
				arg_51_1.var_.moveOldPos10022 = var_54_2.localPosition
				var_54_2.localScale = Vector3.New(1, 1, 1)

				arg_51_1:CheckSpriteTmpPos("10022", 2)

				local var_54_4 = var_54_2.childCount

				for iter_54_0 = 0, var_54_4 - 1 do
					local var_54_5 = var_54_2:GetChild(iter_54_0)

					if var_54_5.name == "split_3" or not string.find(var_54_5.name, "split") then
						var_54_5.gameObject:SetActive(true)
					else
						var_54_5.gameObject:SetActive(false)
					end
				end
			end

			local var_54_6 = 0.001

			if var_54_3 <= arg_51_1.time_ and arg_51_1.time_ < var_54_3 + var_54_6 then
				local var_54_7 = (arg_51_1.time_ - var_54_3) / var_54_6
				local var_54_8 = Vector3.New(-390, -350, -180)

				var_54_2.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos10022, var_54_8, var_54_7)
			end

			if arg_51_1.time_ >= var_54_3 + var_54_6 and arg_51_1.time_ < var_54_3 + var_54_6 + arg_54_0 then
				var_54_2.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_54_9 = arg_51_1.actors_["10022"]
			local var_54_10 = 0

			if var_54_10 < arg_51_1.time_ and arg_51_1.time_ <= var_54_10 + arg_54_0 and arg_51_1.var_.actorSpriteComps10022 == nil then
				arg_51_1.var_.actorSpriteComps10022 = var_54_9:GetComponentsInChildren(typeof(Image), true)
			end

			local var_54_11 = 0.034

			if var_54_10 <= arg_51_1.time_ and arg_51_1.time_ < var_54_10 + var_54_11 then
				local var_54_12 = (arg_51_1.time_ - var_54_10) / var_54_11

				if arg_51_1.var_.actorSpriteComps10022 then
					for iter_54_1, iter_54_2 in pairs(arg_51_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_54_2 then
							local var_54_13 = Mathf.Lerp(iter_54_2.color.r, 1, var_54_12)

							iter_54_2.color = Color.New(var_54_13, var_54_13, var_54_13)
						end
					end
				end
			end

			if arg_51_1.time_ >= var_54_10 + var_54_11 and arg_51_1.time_ < var_54_10 + var_54_11 + arg_54_0 and arg_51_1.var_.actorSpriteComps10022 then
				local var_54_14 = 1

				for iter_54_3, iter_54_4 in pairs(arg_51_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_54_4 then
						iter_54_4.color = Color.New(var_54_14, var_54_14, var_54_14)
					end
				end

				arg_51_1.var_.actorSpriteComps10022 = nil
			end

			local var_54_15 = arg_51_1.actors_["10022"]
			local var_54_16 = 0

			if var_54_16 < arg_51_1.time_ and arg_51_1.time_ <= var_54_16 + arg_54_0 then
				local var_54_17 = var_54_15:GetComponentInChildren(typeof(CanvasGroup))

				if var_54_17 then
					arg_51_1.var_.alphaOldValue10022 = var_54_17.alpha
					arg_51_1.var_.characterEffect10022 = var_54_17
				end

				arg_51_1.var_.alphaOldValue10022 = 0
			end

			local var_54_18 = 0.5

			if var_54_16 <= arg_51_1.time_ and arg_51_1.time_ < var_54_16 + var_54_18 then
				local var_54_19 = (arg_51_1.time_ - var_54_16) / var_54_18
				local var_54_20 = Mathf.Lerp(arg_51_1.var_.alphaOldValue10022, 1, var_54_19)

				if arg_51_1.var_.characterEffect10022 then
					arg_51_1.var_.characterEffect10022.alpha = var_54_20
				end
			end

			if arg_51_1.time_ >= var_54_16 + var_54_18 and arg_51_1.time_ < var_54_16 + var_54_18 + arg_54_0 and arg_51_1.var_.characterEffect10022 then
				arg_51_1.var_.characterEffect10022.alpha = 1
			end

			local var_54_21 = 0
			local var_54_22 = 0.475

			if var_54_21 < arg_51_1.time_ and arg_51_1.time_ <= var_54_21 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_23 = arg_51_1:FormatText(StoryNameCfg[235].name)

				arg_51_1.leftNameTxt_.text = var_54_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_24 = arg_51_1:GetWordFromCfg(114211013)
				local var_54_25 = arg_51_1:FormatText(var_54_24.content)

				arg_51_1.text_.text = var_54_25

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_26 = 19
				local var_54_27 = utf8.len(var_54_25)
				local var_54_28 = var_54_26 <= 0 and var_54_22 or var_54_22 * (var_54_27 / var_54_26)

				if var_54_28 > 0 and var_54_22 < var_54_28 then
					arg_51_1.talkMaxDuration = var_54_28

					if var_54_28 + var_54_21 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_28 + var_54_21
					end
				end

				arg_51_1.text_.text = var_54_25
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114211", "114211013", "story_v_out_114211.awb") ~= 0 then
					local var_54_29 = manager.audio:GetVoiceLength("story_v_out_114211", "114211013", "story_v_out_114211.awb") / 1000

					if var_54_29 + var_54_21 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_29 + var_54_21
					end

					if var_54_24.prefab_name ~= "" and arg_51_1.actors_[var_54_24.prefab_name] ~= nil then
						local var_54_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_24.prefab_name].transform, "story_v_out_114211", "114211013", "story_v_out_114211.awb")

						arg_51_1:RecordAudio("114211013", var_54_30)
						arg_51_1:RecordAudio("114211013", var_54_30)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_114211", "114211013", "story_v_out_114211.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_114211", "114211013", "story_v_out_114211.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_31 = math.max(var_54_22, arg_51_1.talkMaxDuration)

			if var_54_21 <= arg_51_1.time_ and arg_51_1.time_ < var_54_21 + var_54_31 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_21) / var_54_31

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_21 + var_54_31 and arg_51_1.time_ < var_54_21 + var_54_31 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play114211014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 114211014
		arg_55_1.duration_ = 9.433

		local var_55_0 = {
			ja = 7.9,
			ko = 6.5,
			zh = 8.833,
			en = 9.433
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
				arg_55_0:Play114211015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["10017"].transform
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 then
				arg_55_1.var_.moveOldPos10017 = var_58_0.localPosition
				var_58_0.localScale = Vector3.New(1, 1, 1)

				arg_55_1:CheckSpriteTmpPos("10017", 4)
			end

			local var_58_2 = 0.001

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2
				local var_58_4 = Vector3.New(390, -350, -180)

				var_58_0.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos10017, var_58_4, var_58_3)
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 then
				var_58_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_58_5 = arg_55_1.actors_["10022"]
			local var_58_6 = 0

			if var_58_6 < arg_55_1.time_ and arg_55_1.time_ <= var_58_6 + arg_58_0 and arg_55_1.var_.actorSpriteComps10022 == nil then
				arg_55_1.var_.actorSpriteComps10022 = var_58_5:GetComponentsInChildren(typeof(Image), true)
			end

			local var_58_7 = 0.034

			if var_58_6 <= arg_55_1.time_ and arg_55_1.time_ < var_58_6 + var_58_7 then
				local var_58_8 = (arg_55_1.time_ - var_58_6) / var_58_7

				if arg_55_1.var_.actorSpriteComps10022 then
					for iter_58_0, iter_58_1 in pairs(arg_55_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_58_1 then
							local var_58_9 = Mathf.Lerp(iter_58_1.color.r, 0.5, var_58_8)

							iter_58_1.color = Color.New(var_58_9, var_58_9, var_58_9)
						end
					end
				end
			end

			if arg_55_1.time_ >= var_58_6 + var_58_7 and arg_55_1.time_ < var_58_6 + var_58_7 + arg_58_0 and arg_55_1.var_.actorSpriteComps10022 then
				local var_58_10 = 0.5

				for iter_58_2, iter_58_3 in pairs(arg_55_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_58_3 then
						iter_58_3.color = Color.New(var_58_10, var_58_10, var_58_10)
					end
				end

				arg_55_1.var_.actorSpriteComps10022 = nil
			end

			local var_58_11 = arg_55_1.actors_["10017"]
			local var_58_12 = 0

			if var_58_12 < arg_55_1.time_ and arg_55_1.time_ <= var_58_12 + arg_58_0 then
				local var_58_13 = var_58_11:GetComponent("Image")

				if var_58_13 then
					arg_55_1.var_.highlightMatValue10017 = var_58_13
				end
			end

			local var_58_14 = 0.034

			if var_58_12 <= arg_55_1.time_ and arg_55_1.time_ < var_58_12 + var_58_14 then
				local var_58_15 = (arg_55_1.time_ - var_58_12) / var_58_14

				if arg_55_1.var_.highlightMatValue10017 then
					local var_58_16 = Mathf.Lerp(0.5, 1, var_58_15)
					local var_58_17 = arg_55_1.var_.highlightMatValue10017
					local var_58_18 = var_58_17.color

					var_58_18.r = var_58_16
					var_58_18.g = var_58_16
					var_58_18.b = var_58_16
					var_58_17.color = var_58_18
				end
			end

			if arg_55_1.time_ >= var_58_12 + var_58_14 and arg_55_1.time_ < var_58_12 + var_58_14 + arg_58_0 and arg_55_1.var_.highlightMatValue10017 then
				local var_58_19 = 1

				var_58_11.transform:SetSiblingIndex(1)

				local var_58_20 = arg_55_1.var_.highlightMatValue10017
				local var_58_21 = var_58_20.color

				var_58_21.r = var_58_19
				var_58_21.g = var_58_19
				var_58_21.b = var_58_19
				var_58_20.color = var_58_21
			end

			local var_58_22 = arg_55_1.actors_["10017"]
			local var_58_23 = 0

			if var_58_23 < arg_55_1.time_ and arg_55_1.time_ <= var_58_23 + arg_58_0 then
				local var_58_24 = var_58_22:GetComponent("Image")

				if var_58_24 then
					arg_55_1.var_.alphaMatValue10017 = var_58_24
					arg_55_1.var_.alphaOldValue10017 = var_58_24.color.a
				end

				arg_55_1.var_.alphaOldValue10017 = 0
			end

			local var_58_25 = 0.5

			if var_58_23 <= arg_55_1.time_ and arg_55_1.time_ < var_58_23 + var_58_25 then
				local var_58_26 = (arg_55_1.time_ - var_58_23) / var_58_25
				local var_58_27 = Mathf.Lerp(arg_55_1.var_.alphaOldValue10017, 1, var_58_26)

				if arg_55_1.var_.alphaMatValue10017 then
					local var_58_28 = arg_55_1.var_.alphaMatValue10017.color

					var_58_28.a = var_58_27
					arg_55_1.var_.alphaMatValue10017.color = var_58_28
				end
			end

			if arg_55_1.time_ >= var_58_23 + var_58_25 and arg_55_1.time_ < var_58_23 + var_58_25 + arg_58_0 and arg_55_1.var_.alphaMatValue10017 then
				local var_58_29 = arg_55_1.var_.alphaMatValue10017
				local var_58_30 = var_58_29.color

				var_58_30.a = 1
				var_58_29.color = var_58_30
			end

			local var_58_31 = 0
			local var_58_32 = 0.95

			if var_58_31 < arg_55_1.time_ and arg_55_1.time_ <= var_58_31 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_33 = arg_55_1:FormatText(StoryNameCfg[255].name)

				arg_55_1.leftNameTxt_.text = var_58_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_34 = arg_55_1:GetWordFromCfg(114211014)
				local var_58_35 = arg_55_1:FormatText(var_58_34.content)

				arg_55_1.text_.text = var_58_35

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_36 = 38
				local var_58_37 = utf8.len(var_58_35)
				local var_58_38 = var_58_36 <= 0 and var_58_32 or var_58_32 * (var_58_37 / var_58_36)

				if var_58_38 > 0 and var_58_32 < var_58_38 then
					arg_55_1.talkMaxDuration = var_58_38

					if var_58_38 + var_58_31 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_38 + var_58_31
					end
				end

				arg_55_1.text_.text = var_58_35
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114211", "114211014", "story_v_out_114211.awb") ~= 0 then
					local var_58_39 = manager.audio:GetVoiceLength("story_v_out_114211", "114211014", "story_v_out_114211.awb") / 1000

					if var_58_39 + var_58_31 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_39 + var_58_31
					end

					if var_58_34.prefab_name ~= "" and arg_55_1.actors_[var_58_34.prefab_name] ~= nil then
						local var_58_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_34.prefab_name].transform, "story_v_out_114211", "114211014", "story_v_out_114211.awb")

						arg_55_1:RecordAudio("114211014", var_58_40)
						arg_55_1:RecordAudio("114211014", var_58_40)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_114211", "114211014", "story_v_out_114211.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_114211", "114211014", "story_v_out_114211.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_41 = math.max(var_58_32, arg_55_1.talkMaxDuration)

			if var_58_31 <= arg_55_1.time_ and arg_55_1.time_ < var_58_31 + var_58_41 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_31) / var_58_41

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_31 + var_58_41 and arg_55_1.time_ < var_58_31 + var_58_41 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play114211015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 114211015
		arg_59_1.duration_ = 5

		SetActive(arg_59_1.tipsGo_, false)

		function arg_59_1.onSingleLineFinish_()
			arg_59_1.onSingleLineUpdate_ = nil
			arg_59_1.onSingleLineFinish_ = nil
			arg_59_1.state_ = "waiting"
		end

		function arg_59_1.playNext_(arg_61_0)
			if arg_61_0 == 1 then
				arg_59_0:Play114211016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = arg_59_1.actors_["10017"]
			local var_62_1 = 0

			if var_62_1 < arg_59_1.time_ and arg_59_1.time_ <= var_62_1 + arg_62_0 then
				local var_62_2 = var_62_0:GetComponent("Image")

				if var_62_2 then
					arg_59_1.var_.highlightMatValue10017 = var_62_2
				end
			end

			local var_62_3 = 0.034

			if var_62_1 <= arg_59_1.time_ and arg_59_1.time_ < var_62_1 + var_62_3 then
				local var_62_4 = (arg_59_1.time_ - var_62_1) / var_62_3

				if arg_59_1.var_.highlightMatValue10017 then
					local var_62_5 = Mathf.Lerp(1, 0.5, var_62_4)
					local var_62_6 = arg_59_1.var_.highlightMatValue10017
					local var_62_7 = var_62_6.color

					var_62_7.r = var_62_5
					var_62_7.g = var_62_5
					var_62_7.b = var_62_5
					var_62_6.color = var_62_7
				end
			end

			if arg_59_1.time_ >= var_62_1 + var_62_3 and arg_59_1.time_ < var_62_1 + var_62_3 + arg_62_0 and arg_59_1.var_.highlightMatValue10017 then
				local var_62_8 = 0.5
				local var_62_9 = arg_59_1.var_.highlightMatValue10017
				local var_62_10 = var_62_9.color

				var_62_10.r = var_62_8
				var_62_10.g = var_62_8
				var_62_10.b = var_62_8
				var_62_9.color = var_62_10
			end

			local var_62_11 = 0
			local var_62_12 = 0.7

			if var_62_11 < arg_59_1.time_ and arg_59_1.time_ <= var_62_11 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, false)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_13 = arg_59_1:GetWordFromCfg(114211015)
				local var_62_14 = arg_59_1:FormatText(var_62_13.content)

				arg_59_1.text_.text = var_62_14

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_15 = 28
				local var_62_16 = utf8.len(var_62_14)
				local var_62_17 = var_62_15 <= 0 and var_62_12 or var_62_12 * (var_62_16 / var_62_15)

				if var_62_17 > 0 and var_62_12 < var_62_17 then
					arg_59_1.talkMaxDuration = var_62_17

					if var_62_17 + var_62_11 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_17 + var_62_11
					end
				end

				arg_59_1.text_.text = var_62_14
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)
				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_18 = math.max(var_62_12, arg_59_1.talkMaxDuration)

			if var_62_11 <= arg_59_1.time_ and arg_59_1.time_ < var_62_11 + var_62_18 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_11) / var_62_18

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_11 + var_62_18 and arg_59_1.time_ < var_62_11 + var_62_18 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play114211016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 114211016
		arg_63_1.duration_ = 4.9

		local var_63_0 = {
			ja = 4.9,
			ko = 3.166,
			zh = 2.5,
			en = 2.3
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
				arg_63_0:Play114211017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["10022"]
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 and arg_63_1.var_.actorSpriteComps10022 == nil then
				arg_63_1.var_.actorSpriteComps10022 = var_66_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_66_2 = 0.034

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_2 then
				local var_66_3 = (arg_63_1.time_ - var_66_1) / var_66_2

				if arg_63_1.var_.actorSpriteComps10022 then
					for iter_66_0, iter_66_1 in pairs(arg_63_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_66_1 then
							local var_66_4 = Mathf.Lerp(iter_66_1.color.r, 1, var_66_3)

							iter_66_1.color = Color.New(var_66_4, var_66_4, var_66_4)
						end
					end
				end
			end

			if arg_63_1.time_ >= var_66_1 + var_66_2 and arg_63_1.time_ < var_66_1 + var_66_2 + arg_66_0 and arg_63_1.var_.actorSpriteComps10022 then
				local var_66_5 = 1

				for iter_66_2, iter_66_3 in pairs(arg_63_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_66_3 then
						iter_66_3.color = Color.New(var_66_5, var_66_5, var_66_5)
					end
				end

				arg_63_1.var_.actorSpriteComps10022 = nil
			end

			local var_66_6 = 0
			local var_66_7 = 0.375

			if var_66_6 < arg_63_1.time_ and arg_63_1.time_ <= var_66_6 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_8 = arg_63_1:FormatText(StoryNameCfg[235].name)

				arg_63_1.leftNameTxt_.text = var_66_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_9 = arg_63_1:GetWordFromCfg(114211016)
				local var_66_10 = arg_63_1:FormatText(var_66_9.content)

				arg_63_1.text_.text = var_66_10

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_11 = 15
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

				if manager.audio:GetVoiceLength("story_v_out_114211", "114211016", "story_v_out_114211.awb") ~= 0 then
					local var_66_14 = manager.audio:GetVoiceLength("story_v_out_114211", "114211016", "story_v_out_114211.awb") / 1000

					if var_66_14 + var_66_6 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_14 + var_66_6
					end

					if var_66_9.prefab_name ~= "" and arg_63_1.actors_[var_66_9.prefab_name] ~= nil then
						local var_66_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_9.prefab_name].transform, "story_v_out_114211", "114211016", "story_v_out_114211.awb")

						arg_63_1:RecordAudio("114211016", var_66_15)
						arg_63_1:RecordAudio("114211016", var_66_15)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_114211", "114211016", "story_v_out_114211.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_114211", "114211016", "story_v_out_114211.awb")
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
	Play114211017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 114211017
		arg_67_1.duration_ = 7.066

		local var_67_0 = {
			ja = 5.566,
			ko = 6.7,
			zh = 7.066,
			en = 6.9
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
				arg_67_0:Play114211018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["10022"]
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 and arg_67_1.var_.actorSpriteComps10022 == nil then
				arg_67_1.var_.actorSpriteComps10022 = var_70_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_70_2 = 0.034

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_2 then
				local var_70_3 = (arg_67_1.time_ - var_70_1) / var_70_2

				if arg_67_1.var_.actorSpriteComps10022 then
					for iter_70_0, iter_70_1 in pairs(arg_67_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_70_1 then
							local var_70_4 = Mathf.Lerp(iter_70_1.color.r, 0.5, var_70_3)

							iter_70_1.color = Color.New(var_70_4, var_70_4, var_70_4)
						end
					end
				end
			end

			if arg_67_1.time_ >= var_70_1 + var_70_2 and arg_67_1.time_ < var_70_1 + var_70_2 + arg_70_0 and arg_67_1.var_.actorSpriteComps10022 then
				local var_70_5 = 0.5

				for iter_70_2, iter_70_3 in pairs(arg_67_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_70_3 then
						iter_70_3.color = Color.New(var_70_5, var_70_5, var_70_5)
					end
				end

				arg_67_1.var_.actorSpriteComps10022 = nil
			end

			local var_70_6 = arg_67_1.actors_["10017"]
			local var_70_7 = 0

			if var_70_7 < arg_67_1.time_ and arg_67_1.time_ <= var_70_7 + arg_70_0 then
				local var_70_8 = var_70_6:GetComponent("Image")

				if var_70_8 then
					arg_67_1.var_.highlightMatValue10017 = var_70_8
				end
			end

			local var_70_9 = 0.034

			if var_70_7 <= arg_67_1.time_ and arg_67_1.time_ < var_70_7 + var_70_9 then
				local var_70_10 = (arg_67_1.time_ - var_70_7) / var_70_9

				if arg_67_1.var_.highlightMatValue10017 then
					local var_70_11 = Mathf.Lerp(0.5, 1, var_70_10)
					local var_70_12 = arg_67_1.var_.highlightMatValue10017
					local var_70_13 = var_70_12.color

					var_70_13.r = var_70_11
					var_70_13.g = var_70_11
					var_70_13.b = var_70_11
					var_70_12.color = var_70_13
				end
			end

			if arg_67_1.time_ >= var_70_7 + var_70_9 and arg_67_1.time_ < var_70_7 + var_70_9 + arg_70_0 and arg_67_1.var_.highlightMatValue10017 then
				local var_70_14 = 1

				var_70_6.transform:SetSiblingIndex(1)

				local var_70_15 = arg_67_1.var_.highlightMatValue10017
				local var_70_16 = var_70_15.color

				var_70_16.r = var_70_14
				var_70_16.g = var_70_14
				var_70_16.b = var_70_14
				var_70_15.color = var_70_16
			end

			local var_70_17 = 0
			local var_70_18 = 0.725

			if var_70_17 < arg_67_1.time_ and arg_67_1.time_ <= var_70_17 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_19 = arg_67_1:FormatText(StoryNameCfg[255].name)

				arg_67_1.leftNameTxt_.text = var_70_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_20 = arg_67_1:GetWordFromCfg(114211017)
				local var_70_21 = arg_67_1:FormatText(var_70_20.content)

				arg_67_1.text_.text = var_70_21

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_22 = 29
				local var_70_23 = utf8.len(var_70_21)
				local var_70_24 = var_70_22 <= 0 and var_70_18 or var_70_18 * (var_70_23 / var_70_22)

				if var_70_24 > 0 and var_70_18 < var_70_24 then
					arg_67_1.talkMaxDuration = var_70_24

					if var_70_24 + var_70_17 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_24 + var_70_17
					end
				end

				arg_67_1.text_.text = var_70_21
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114211", "114211017", "story_v_out_114211.awb") ~= 0 then
					local var_70_25 = manager.audio:GetVoiceLength("story_v_out_114211", "114211017", "story_v_out_114211.awb") / 1000

					if var_70_25 + var_70_17 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_25 + var_70_17
					end

					if var_70_20.prefab_name ~= "" and arg_67_1.actors_[var_70_20.prefab_name] ~= nil then
						local var_70_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_20.prefab_name].transform, "story_v_out_114211", "114211017", "story_v_out_114211.awb")

						arg_67_1:RecordAudio("114211017", var_70_26)
						arg_67_1:RecordAudio("114211017", var_70_26)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_114211", "114211017", "story_v_out_114211.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_114211", "114211017", "story_v_out_114211.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_27 = math.max(var_70_18, arg_67_1.talkMaxDuration)

			if var_70_17 <= arg_67_1.time_ and arg_67_1.time_ < var_70_17 + var_70_27 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_17) / var_70_27

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_17 + var_70_27 and arg_67_1.time_ < var_70_17 + var_70_27 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play114211018 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 114211018
		arg_71_1.duration_ = 6.933

		local var_71_0 = {
			ja = 6.933,
			ko = 3.533,
			zh = 2.966,
			en = 2.566
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
				arg_71_0:Play114211019(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["10022"]
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 and arg_71_1.var_.actorSpriteComps10022 == nil then
				arg_71_1.var_.actorSpriteComps10022 = var_74_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_74_2 = 0.034

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_2 then
				local var_74_3 = (arg_71_1.time_ - var_74_1) / var_74_2

				if arg_71_1.var_.actorSpriteComps10022 then
					for iter_74_0, iter_74_1 in pairs(arg_71_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_74_1 then
							local var_74_4 = Mathf.Lerp(iter_74_1.color.r, 1, var_74_3)

							iter_74_1.color = Color.New(var_74_4, var_74_4, var_74_4)
						end
					end
				end
			end

			if arg_71_1.time_ >= var_74_1 + var_74_2 and arg_71_1.time_ < var_74_1 + var_74_2 + arg_74_0 and arg_71_1.var_.actorSpriteComps10022 then
				local var_74_5 = 1

				for iter_74_2, iter_74_3 in pairs(arg_71_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_74_3 then
						iter_74_3.color = Color.New(var_74_5, var_74_5, var_74_5)
					end
				end

				arg_71_1.var_.actorSpriteComps10022 = nil
			end

			local var_74_6 = arg_71_1.actors_["10017"]
			local var_74_7 = 0

			if var_74_7 < arg_71_1.time_ and arg_71_1.time_ <= var_74_7 + arg_74_0 then
				local var_74_8 = var_74_6:GetComponent("Image")

				if var_74_8 then
					arg_71_1.var_.highlightMatValue10017 = var_74_8
				end
			end

			local var_74_9 = 0.034

			if var_74_7 <= arg_71_1.time_ and arg_71_1.time_ < var_74_7 + var_74_9 then
				local var_74_10 = (arg_71_1.time_ - var_74_7) / var_74_9

				if arg_71_1.var_.highlightMatValue10017 then
					local var_74_11 = Mathf.Lerp(1, 0.5, var_74_10)
					local var_74_12 = arg_71_1.var_.highlightMatValue10017
					local var_74_13 = var_74_12.color

					var_74_13.r = var_74_11
					var_74_13.g = var_74_11
					var_74_13.b = var_74_11
					var_74_12.color = var_74_13
				end
			end

			if arg_71_1.time_ >= var_74_7 + var_74_9 and arg_71_1.time_ < var_74_7 + var_74_9 + arg_74_0 and arg_71_1.var_.highlightMatValue10017 then
				local var_74_14 = 0.5
				local var_74_15 = arg_71_1.var_.highlightMatValue10017
				local var_74_16 = var_74_15.color

				var_74_16.r = var_74_14
				var_74_16.g = var_74_14
				var_74_16.b = var_74_14
				var_74_15.color = var_74_16
			end

			local var_74_17 = 0
			local var_74_18 = 0.375

			if var_74_17 < arg_71_1.time_ and arg_71_1.time_ <= var_74_17 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_19 = arg_71_1:FormatText(StoryNameCfg[235].name)

				arg_71_1.leftNameTxt_.text = var_74_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_20 = arg_71_1:GetWordFromCfg(114211018)
				local var_74_21 = arg_71_1:FormatText(var_74_20.content)

				arg_71_1.text_.text = var_74_21

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_22 = 15
				local var_74_23 = utf8.len(var_74_21)
				local var_74_24 = var_74_22 <= 0 and var_74_18 or var_74_18 * (var_74_23 / var_74_22)

				if var_74_24 > 0 and var_74_18 < var_74_24 then
					arg_71_1.talkMaxDuration = var_74_24

					if var_74_24 + var_74_17 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_24 + var_74_17
					end
				end

				arg_71_1.text_.text = var_74_21
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114211", "114211018", "story_v_out_114211.awb") ~= 0 then
					local var_74_25 = manager.audio:GetVoiceLength("story_v_out_114211", "114211018", "story_v_out_114211.awb") / 1000

					if var_74_25 + var_74_17 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_25 + var_74_17
					end

					if var_74_20.prefab_name ~= "" and arg_71_1.actors_[var_74_20.prefab_name] ~= nil then
						local var_74_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_20.prefab_name].transform, "story_v_out_114211", "114211018", "story_v_out_114211.awb")

						arg_71_1:RecordAudio("114211018", var_74_26)
						arg_71_1:RecordAudio("114211018", var_74_26)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_114211", "114211018", "story_v_out_114211.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_114211", "114211018", "story_v_out_114211.awb")
				end

				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_27 = math.max(var_74_18, arg_71_1.talkMaxDuration)

			if var_74_17 <= arg_71_1.time_ and arg_71_1.time_ < var_74_17 + var_74_27 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_17) / var_74_27

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_17 + var_74_27 and arg_71_1.time_ < var_74_17 + var_74_27 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play114211019 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 114211019
		arg_75_1.duration_ = 4.966

		local var_75_0 = {
			ja = 4.966,
			ko = 3.1,
			zh = 3.566,
			en = 3.466
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
				arg_75_0:Play114211020(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["10015"].transform
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 then
				arg_75_1.var_.moveOldPos10015 = var_78_0.localPosition
				var_78_0.localScale = Vector3.New(1, 1, 1)

				arg_75_1:CheckSpriteTmpPos("10015", 4)

				local var_78_2 = var_78_0.childCount

				for iter_78_0 = 0, var_78_2 - 1 do
					local var_78_3 = var_78_0:GetChild(iter_78_0)

					if var_78_3.name == "split_1" or not string.find(var_78_3.name, "split") then
						var_78_3.gameObject:SetActive(true)
					else
						var_78_3.gameObject:SetActive(false)
					end
				end
			end

			local var_78_4 = 0.001

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_4 then
				local var_78_5 = (arg_75_1.time_ - var_78_1) / var_78_4
				local var_78_6 = Vector3.New(390, -350, -180)

				var_78_0.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos10015, var_78_6, var_78_5)
			end

			if arg_75_1.time_ >= var_78_1 + var_78_4 and arg_75_1.time_ < var_78_1 + var_78_4 + arg_78_0 then
				var_78_0.localPosition = Vector3.New(390, -350, -180)
			end

			local var_78_7 = arg_75_1.actors_["10022"]
			local var_78_8 = 0

			if var_78_8 < arg_75_1.time_ and arg_75_1.time_ <= var_78_8 + arg_78_0 and arg_75_1.var_.actorSpriteComps10022 == nil then
				arg_75_1.var_.actorSpriteComps10022 = var_78_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_78_9 = 0.034

			if var_78_8 <= arg_75_1.time_ and arg_75_1.time_ < var_78_8 + var_78_9 then
				local var_78_10 = (arg_75_1.time_ - var_78_8) / var_78_9

				if arg_75_1.var_.actorSpriteComps10022 then
					for iter_78_1, iter_78_2 in pairs(arg_75_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_78_2 then
							local var_78_11 = Mathf.Lerp(iter_78_2.color.r, 0.5, var_78_10)

							iter_78_2.color = Color.New(var_78_11, var_78_11, var_78_11)
						end
					end
				end
			end

			if arg_75_1.time_ >= var_78_8 + var_78_9 and arg_75_1.time_ < var_78_8 + var_78_9 + arg_78_0 and arg_75_1.var_.actorSpriteComps10022 then
				local var_78_12 = 0.5

				for iter_78_3, iter_78_4 in pairs(arg_75_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_78_4 then
						iter_78_4.color = Color.New(var_78_12, var_78_12, var_78_12)
					end
				end

				arg_75_1.var_.actorSpriteComps10022 = nil
			end

			local var_78_13 = arg_75_1.actors_["10015"]
			local var_78_14 = 0

			if var_78_14 < arg_75_1.time_ and arg_75_1.time_ <= var_78_14 + arg_78_0 and arg_75_1.var_.actorSpriteComps10015 == nil then
				arg_75_1.var_.actorSpriteComps10015 = var_78_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_78_15 = 0.034

			if var_78_14 <= arg_75_1.time_ and arg_75_1.time_ < var_78_14 + var_78_15 then
				local var_78_16 = (arg_75_1.time_ - var_78_14) / var_78_15

				if arg_75_1.var_.actorSpriteComps10015 then
					for iter_78_5, iter_78_6 in pairs(arg_75_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_78_6 then
							local var_78_17 = Mathf.Lerp(iter_78_6.color.r, 1, var_78_16)

							iter_78_6.color = Color.New(var_78_17, var_78_17, var_78_17)
						end
					end
				end
			end

			if arg_75_1.time_ >= var_78_14 + var_78_15 and arg_75_1.time_ < var_78_14 + var_78_15 + arg_78_0 and arg_75_1.var_.actorSpriteComps10015 then
				local var_78_18 = 1

				for iter_78_7, iter_78_8 in pairs(arg_75_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_78_8 then
						iter_78_8.color = Color.New(var_78_18, var_78_18, var_78_18)
					end
				end

				arg_75_1.var_.actorSpriteComps10015 = nil
			end

			local var_78_19 = arg_75_1.actors_["10015"]
			local var_78_20 = 0

			if var_78_20 < arg_75_1.time_ and arg_75_1.time_ <= var_78_20 + arg_78_0 then
				local var_78_21 = var_78_19:GetComponentInChildren(typeof(CanvasGroup))

				if var_78_21 then
					arg_75_1.var_.alphaOldValue10015 = var_78_21.alpha
					arg_75_1.var_.characterEffect10015 = var_78_21
				end

				arg_75_1.var_.alphaOldValue10015 = 0
			end

			local var_78_22 = 0.5

			if var_78_20 <= arg_75_1.time_ and arg_75_1.time_ < var_78_20 + var_78_22 then
				local var_78_23 = (arg_75_1.time_ - var_78_20) / var_78_22
				local var_78_24 = Mathf.Lerp(arg_75_1.var_.alphaOldValue10015, 1, var_78_23)

				if arg_75_1.var_.characterEffect10015 then
					arg_75_1.var_.characterEffect10015.alpha = var_78_24
				end
			end

			if arg_75_1.time_ >= var_78_20 + var_78_22 and arg_75_1.time_ < var_78_20 + var_78_22 + arg_78_0 and arg_75_1.var_.characterEffect10015 then
				arg_75_1.var_.characterEffect10015.alpha = 1
			end

			local var_78_25 = 0
			local var_78_26 = 0.4

			if var_78_25 < arg_75_1.time_ and arg_75_1.time_ <= var_78_25 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_27 = arg_75_1:FormatText(StoryNameCfg[208].name)

				arg_75_1.leftNameTxt_.text = var_78_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_28 = arg_75_1:GetWordFromCfg(114211019)
				local var_78_29 = arg_75_1:FormatText(var_78_28.content)

				arg_75_1.text_.text = var_78_29

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_30 = 16
				local var_78_31 = utf8.len(var_78_29)
				local var_78_32 = var_78_30 <= 0 and var_78_26 or var_78_26 * (var_78_31 / var_78_30)

				if var_78_32 > 0 and var_78_26 < var_78_32 then
					arg_75_1.talkMaxDuration = var_78_32

					if var_78_32 + var_78_25 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_32 + var_78_25
					end
				end

				arg_75_1.text_.text = var_78_29
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114211", "114211019", "story_v_out_114211.awb") ~= 0 then
					local var_78_33 = manager.audio:GetVoiceLength("story_v_out_114211", "114211019", "story_v_out_114211.awb") / 1000

					if var_78_33 + var_78_25 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_33 + var_78_25
					end

					if var_78_28.prefab_name ~= "" and arg_75_1.actors_[var_78_28.prefab_name] ~= nil then
						local var_78_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_28.prefab_name].transform, "story_v_out_114211", "114211019", "story_v_out_114211.awb")

						arg_75_1:RecordAudio("114211019", var_78_34)
						arg_75_1:RecordAudio("114211019", var_78_34)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_114211", "114211019", "story_v_out_114211.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_114211", "114211019", "story_v_out_114211.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_35 = math.max(var_78_26, arg_75_1.talkMaxDuration)

			if var_78_25 <= arg_75_1.time_ and arg_75_1.time_ < var_78_25 + var_78_35 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_25) / var_78_35

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_25 + var_78_35 and arg_75_1.time_ < var_78_25 + var_78_35 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play114211020 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 114211020
		arg_79_1.duration_ = 2.033

		local var_79_0 = {
			ja = 2,
			ko = 1.166,
			zh = 2.033,
			en = 1.166
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
				arg_79_0:Play114211021(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["10022"]
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 and arg_79_1.var_.actorSpriteComps10022 == nil then
				arg_79_1.var_.actorSpriteComps10022 = var_82_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_82_2 = 0.034

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2

				if arg_79_1.var_.actorSpriteComps10022 then
					for iter_82_0, iter_82_1 in pairs(arg_79_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_82_1 then
							local var_82_4 = Mathf.Lerp(iter_82_1.color.r, 1, var_82_3)

							iter_82_1.color = Color.New(var_82_4, var_82_4, var_82_4)
						end
					end
				end
			end

			if arg_79_1.time_ >= var_82_1 + var_82_2 and arg_79_1.time_ < var_82_1 + var_82_2 + arg_82_0 and arg_79_1.var_.actorSpriteComps10022 then
				local var_82_5 = 1

				for iter_82_2, iter_82_3 in pairs(arg_79_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_82_3 then
						iter_82_3.color = Color.New(var_82_5, var_82_5, var_82_5)
					end
				end

				arg_79_1.var_.actorSpriteComps10022 = nil
			end

			local var_82_6 = arg_79_1.actors_["10015"]
			local var_82_7 = 0

			if var_82_7 < arg_79_1.time_ and arg_79_1.time_ <= var_82_7 + arg_82_0 and arg_79_1.var_.actorSpriteComps10015 == nil then
				arg_79_1.var_.actorSpriteComps10015 = var_82_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_82_8 = 0.034

			if var_82_7 <= arg_79_1.time_ and arg_79_1.time_ < var_82_7 + var_82_8 then
				local var_82_9 = (arg_79_1.time_ - var_82_7) / var_82_8

				if arg_79_1.var_.actorSpriteComps10015 then
					for iter_82_4, iter_82_5 in pairs(arg_79_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_82_5 then
							local var_82_10 = Mathf.Lerp(iter_82_5.color.r, 0.5, var_82_9)

							iter_82_5.color = Color.New(var_82_10, var_82_10, var_82_10)
						end
					end
				end
			end

			if arg_79_1.time_ >= var_82_7 + var_82_8 and arg_79_1.time_ < var_82_7 + var_82_8 + arg_82_0 and arg_79_1.var_.actorSpriteComps10015 then
				local var_82_11 = 0.5

				for iter_82_6, iter_82_7 in pairs(arg_79_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_82_7 then
						iter_82_7.color = Color.New(var_82_11, var_82_11, var_82_11)
					end
				end

				arg_79_1.var_.actorSpriteComps10015 = nil
			end

			local var_82_12 = arg_79_1.actors_["10022"].transform
			local var_82_13 = 0

			if var_82_13 < arg_79_1.time_ and arg_79_1.time_ <= var_82_13 + arg_82_0 then
				arg_79_1.var_.moveOldPos10022 = var_82_12.localPosition
				var_82_12.localScale = Vector3.New(1, 1, 1)

				arg_79_1:CheckSpriteTmpPos("10022", 2)

				local var_82_14 = var_82_12.childCount

				for iter_82_8 = 0, var_82_14 - 1 do
					local var_82_15 = var_82_12:GetChild(iter_82_8)

					if var_82_15.name == "split_6" or not string.find(var_82_15.name, "split") then
						var_82_15.gameObject:SetActive(true)
					else
						var_82_15.gameObject:SetActive(false)
					end
				end
			end

			local var_82_16 = 0.001

			if var_82_13 <= arg_79_1.time_ and arg_79_1.time_ < var_82_13 + var_82_16 then
				local var_82_17 = (arg_79_1.time_ - var_82_13) / var_82_16
				local var_82_18 = Vector3.New(-390, -350, -180)

				var_82_12.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos10022, var_82_18, var_82_17)
			end

			if arg_79_1.time_ >= var_82_13 + var_82_16 and arg_79_1.time_ < var_82_13 + var_82_16 + arg_82_0 then
				var_82_12.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_82_19 = 0
			local var_82_20 = 0.1

			if var_82_19 < arg_79_1.time_ and arg_79_1.time_ <= var_82_19 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_21 = arg_79_1:FormatText(StoryNameCfg[235].name)

				arg_79_1.leftNameTxt_.text = var_82_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_22 = arg_79_1:GetWordFromCfg(114211020)
				local var_82_23 = arg_79_1:FormatText(var_82_22.content)

				arg_79_1.text_.text = var_82_23

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_24 = 4
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

				if manager.audio:GetVoiceLength("story_v_out_114211", "114211020", "story_v_out_114211.awb") ~= 0 then
					local var_82_27 = manager.audio:GetVoiceLength("story_v_out_114211", "114211020", "story_v_out_114211.awb") / 1000

					if var_82_27 + var_82_19 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_27 + var_82_19
					end

					if var_82_22.prefab_name ~= "" and arg_79_1.actors_[var_82_22.prefab_name] ~= nil then
						local var_82_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_22.prefab_name].transform, "story_v_out_114211", "114211020", "story_v_out_114211.awb")

						arg_79_1:RecordAudio("114211020", var_82_28)
						arg_79_1:RecordAudio("114211020", var_82_28)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_114211", "114211020", "story_v_out_114211.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_114211", "114211020", "story_v_out_114211.awb")
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
	Play114211021 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 114211021
		arg_83_1.duration_ = 7.1

		local var_83_0 = {
			ja = 7.1,
			ko = 5.8,
			zh = 4.366,
			en = 4.033
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
				arg_83_0:Play114211022(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["10022"]
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 and arg_83_1.var_.actorSpriteComps10022 == nil then
				arg_83_1.var_.actorSpriteComps10022 = var_86_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_86_2 = 0.034

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_2 then
				local var_86_3 = (arg_83_1.time_ - var_86_1) / var_86_2

				if arg_83_1.var_.actorSpriteComps10022 then
					for iter_86_0, iter_86_1 in pairs(arg_83_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_86_1 then
							local var_86_4 = Mathf.Lerp(iter_86_1.color.r, 0.5, var_86_3)

							iter_86_1.color = Color.New(var_86_4, var_86_4, var_86_4)
						end
					end
				end
			end

			if arg_83_1.time_ >= var_86_1 + var_86_2 and arg_83_1.time_ < var_86_1 + var_86_2 + arg_86_0 and arg_83_1.var_.actorSpriteComps10022 then
				local var_86_5 = 0.5

				for iter_86_2, iter_86_3 in pairs(arg_83_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_86_3 then
						iter_86_3.color = Color.New(var_86_5, var_86_5, var_86_5)
					end
				end

				arg_83_1.var_.actorSpriteComps10022 = nil
			end

			local var_86_6 = arg_83_1.actors_["10015"]
			local var_86_7 = 0

			if var_86_7 < arg_83_1.time_ and arg_83_1.time_ <= var_86_7 + arg_86_0 and arg_83_1.var_.actorSpriteComps10015 == nil then
				arg_83_1.var_.actorSpriteComps10015 = var_86_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_86_8 = 0.034

			if var_86_7 <= arg_83_1.time_ and arg_83_1.time_ < var_86_7 + var_86_8 then
				local var_86_9 = (arg_83_1.time_ - var_86_7) / var_86_8

				if arg_83_1.var_.actorSpriteComps10015 then
					for iter_86_4, iter_86_5 in pairs(arg_83_1.var_.actorSpriteComps10015:ToTable()) do
						if iter_86_5 then
							local var_86_10 = Mathf.Lerp(iter_86_5.color.r, 1, var_86_9)

							iter_86_5.color = Color.New(var_86_10, var_86_10, var_86_10)
						end
					end
				end
			end

			if arg_83_1.time_ >= var_86_7 + var_86_8 and arg_83_1.time_ < var_86_7 + var_86_8 + arg_86_0 and arg_83_1.var_.actorSpriteComps10015 then
				local var_86_11 = 1

				for iter_86_6, iter_86_7 in pairs(arg_83_1.var_.actorSpriteComps10015:ToTable()) do
					if iter_86_7 then
						iter_86_7.color = Color.New(var_86_11, var_86_11, var_86_11)
					end
				end

				arg_83_1.var_.actorSpriteComps10015 = nil
			end

			local var_86_12 = 0
			local var_86_13 = 0.575

			if var_86_12 < arg_83_1.time_ and arg_83_1.time_ <= var_86_12 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_14 = arg_83_1:FormatText(StoryNameCfg[208].name)

				arg_83_1.leftNameTxt_.text = var_86_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_15 = arg_83_1:GetWordFromCfg(114211021)
				local var_86_16 = arg_83_1:FormatText(var_86_15.content)

				arg_83_1.text_.text = var_86_16

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_17 = 23
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

				if manager.audio:GetVoiceLength("story_v_out_114211", "114211021", "story_v_out_114211.awb") ~= 0 then
					local var_86_20 = manager.audio:GetVoiceLength("story_v_out_114211", "114211021", "story_v_out_114211.awb") / 1000

					if var_86_20 + var_86_12 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_20 + var_86_12
					end

					if var_86_15.prefab_name ~= "" and arg_83_1.actors_[var_86_15.prefab_name] ~= nil then
						local var_86_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_15.prefab_name].transform, "story_v_out_114211", "114211021", "story_v_out_114211.awb")

						arg_83_1:RecordAudio("114211021", var_86_21)
						arg_83_1:RecordAudio("114211021", var_86_21)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_114211", "114211021", "story_v_out_114211.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_114211", "114211021", "story_v_out_114211.awb")
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
	Play114211022 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 114211022
		arg_87_1.duration_ = 5

		SetActive(arg_87_1.tipsGo_, false)

		function arg_87_1.onSingleLineFinish_()
			arg_87_1.onSingleLineUpdate_ = nil
			arg_87_1.onSingleLineFinish_ = nil
			arg_87_1.state_ = "waiting"
			arg_87_1.auto_ = false
		end

		function arg_87_1.playNext_(arg_89_0)
			arg_87_1.onStoryFinished_()
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["10022"]
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 then
				local var_90_2 = var_90_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_90_2 then
					arg_87_1.var_.alphaOldValue10022 = var_90_2.alpha
					arg_87_1.var_.characterEffect10022 = var_90_2
				end

				arg_87_1.var_.alphaOldValue10022 = 1
			end

			local var_90_3 = 0.5

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_3 then
				local var_90_4 = (arg_87_1.time_ - var_90_1) / var_90_3
				local var_90_5 = Mathf.Lerp(arg_87_1.var_.alphaOldValue10022, 0, var_90_4)

				if arg_87_1.var_.characterEffect10022 then
					arg_87_1.var_.characterEffect10022.alpha = var_90_5
				end
			end

			if arg_87_1.time_ >= var_90_1 + var_90_3 and arg_87_1.time_ < var_90_1 + var_90_3 + arg_90_0 and arg_87_1.var_.characterEffect10022 then
				arg_87_1.var_.characterEffect10022.alpha = 0
			end

			local var_90_6 = 0
			local var_90_7 = 1.325

			if var_90_6 < arg_87_1.time_ and arg_87_1.time_ <= var_90_6 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, false)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_8 = arg_87_1:GetWordFromCfg(114211022)
				local var_90_9 = arg_87_1:FormatText(var_90_8.content)

				arg_87_1.text_.text = var_90_9

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_10 = 53
				local var_90_11 = utf8.len(var_90_9)
				local var_90_12 = var_90_10 <= 0 and var_90_7 or var_90_7 * (var_90_11 / var_90_10)

				if var_90_12 > 0 and var_90_7 < var_90_12 then
					arg_87_1.talkMaxDuration = var_90_12

					if var_90_12 + var_90_6 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_12 + var_90_6
					end
				end

				arg_87_1.text_.text = var_90_9
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)
				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_13 = math.max(var_90_7, arg_87_1.talkMaxDuration)

			if var_90_6 <= arg_87_1.time_ and arg_87_1.time_ < var_90_6 + var_90_13 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_6) / var_90_13

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_6 + var_90_13 and arg_87_1.time_ < var_90_6 + var_90_13 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/F04"
	},
	voices = {
		"story_v_out_114211.awb"
	}
}
