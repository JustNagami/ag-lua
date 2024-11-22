return {
	Play114281001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 114281001
		arg_1_1.duration_ = 8.133

		local var_1_0 = {
			ja = 8.133,
			ko = 6.066,
			zh = 7.4,
			en = 4.466
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
				arg_1_0:Play114281002(arg_1_1)
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

			local var_4_22 = "10022"

			if arg_1_1.actors_[var_4_22] == nil then
				local var_4_23 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_4_22), arg_1_1.canvasGo_.transform)

				var_4_23.transform:SetSiblingIndex(1)

				var_4_23.name = var_4_22
				var_4_23.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_1_1.actors_[var_4_22] = var_4_23
			end

			local var_4_24 = arg_1_1.actors_["10022"].transform
			local var_4_25 = 1.8

			if var_4_25 < arg_1_1.time_ and arg_1_1.time_ <= var_4_25 + arg_4_0 then
				arg_1_1.var_.moveOldPos10022 = var_4_24.localPosition
				var_4_24.localScale = Vector3.New(1, 1, 1)

				arg_1_1:CheckSpriteTmpPos("10022", 2)

				local var_4_26 = var_4_24.childCount

				for iter_4_2 = 0, var_4_26 - 1 do
					local var_4_27 = var_4_24:GetChild(iter_4_2)

					if var_4_27.name == "split_6" or not string.find(var_4_27.name, "split") then
						var_4_27.gameObject:SetActive(true)
					else
						var_4_27.gameObject:SetActive(false)
					end
				end
			end

			local var_4_28 = 0.001

			if var_4_25 <= arg_1_1.time_ and arg_1_1.time_ < var_4_25 + var_4_28 then
				local var_4_29 = (arg_1_1.time_ - var_4_25) / var_4_28
				local var_4_30 = Vector3.New(-390, -350, -180)

				var_4_24.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPos10022, var_4_30, var_4_29)
			end

			if arg_1_1.time_ >= var_4_25 + var_4_28 and arg_1_1.time_ < var_4_25 + var_4_28 + arg_4_0 then
				var_4_24.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_4_31 = arg_1_1.actors_["10022"]
			local var_4_32 = 1.8

			if var_4_32 < arg_1_1.time_ and arg_1_1.time_ <= var_4_32 + arg_4_0 and arg_1_1.var_.actorSpriteComps10022 == nil then
				arg_1_1.var_.actorSpriteComps10022 = var_4_31:GetComponentsInChildren(typeof(Image), true)
			end

			local var_4_33 = 0.034

			if var_4_32 <= arg_1_1.time_ and arg_1_1.time_ < var_4_32 + var_4_33 then
				local var_4_34 = (arg_1_1.time_ - var_4_32) / var_4_33

				if arg_1_1.var_.actorSpriteComps10022 then
					for iter_4_3, iter_4_4 in pairs(arg_1_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_4_4 then
							local var_4_35 = Mathf.Lerp(iter_4_4.color.r, 1, var_4_34)

							iter_4_4.color = Color.New(var_4_35, var_4_35, var_4_35)
						end
					end
				end
			end

			if arg_1_1.time_ >= var_4_32 + var_4_33 and arg_1_1.time_ < var_4_32 + var_4_33 + arg_4_0 and arg_1_1.var_.actorSpriteComps10022 then
				local var_4_36 = 1

				for iter_4_5, iter_4_6 in pairs(arg_1_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_4_6 then
						iter_4_6.color = Color.New(var_4_36, var_4_36, var_4_36)
					end
				end

				arg_1_1.var_.actorSpriteComps10022 = nil
			end

			local var_4_37 = arg_1_1.actors_["10022"]
			local var_4_38 = 1.8

			if var_4_38 < arg_1_1.time_ and arg_1_1.time_ <= var_4_38 + arg_4_0 then
				local var_4_39 = var_4_37:GetComponentInChildren(typeof(CanvasGroup))

				if var_4_39 then
					arg_1_1.var_.alphaOldValue10022 = var_4_39.alpha
					arg_1_1.var_.characterEffect10022 = var_4_39
				end

				arg_1_1.var_.alphaOldValue10022 = 0
			end

			local var_4_40 = 0.5

			if var_4_38 <= arg_1_1.time_ and arg_1_1.time_ < var_4_38 + var_4_40 then
				local var_4_41 = (arg_1_1.time_ - var_4_38) / var_4_40
				local var_4_42 = Mathf.Lerp(arg_1_1.var_.alphaOldValue10022, 1, var_4_41)

				if arg_1_1.var_.characterEffect10022 then
					arg_1_1.var_.characterEffect10022.alpha = var_4_42
				end
			end

			if arg_1_1.time_ >= var_4_38 + var_4_40 and arg_1_1.time_ < var_4_38 + var_4_40 + arg_4_0 and arg_1_1.var_.characterEffect10022 then
				arg_1_1.var_.characterEffect10022.alpha = 1
			end

			local var_4_43 = 0
			local var_4_44 = 1

			if var_4_43 < arg_1_1.time_ and arg_1_1.time_ <= var_4_43 + arg_4_0 then
				local var_4_45 = "play"
				local var_4_46 = "music"

				arg_1_1:AudioAction(var_4_45, var_4_46, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_47 = 2
			local var_4_48 = 0.533333333333333

			if var_4_47 < arg_1_1.time_ and arg_1_1.time_ <= var_4_47 + arg_4_0 then
				local var_4_49 = "play"
				local var_4_50 = "music"

				arg_1_1:AudioAction(var_4_49, var_4_50, "bgm_activity_1_3_story_battle", "bgm_activity_1_3_story_battle", "bgm_activity_1_3_story_battle.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_51 = 2
			local var_4_52 = 0.3

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

				local var_4_54 = arg_1_1:FormatText(StoryNameCfg[235].name)

				arg_1_1.leftNameTxt_.text = var_4_54

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_55 = arg_1_1:GetWordFromCfg(114281001)
				local var_4_56 = arg_1_1:FormatText(var_4_55.content)

				arg_1_1.text_.text = var_4_56

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_57 = 12
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

				if manager.audio:GetVoiceLength("story_v_out_114281", "114281001", "story_v_out_114281.awb") ~= 0 then
					local var_4_60 = manager.audio:GetVoiceLength("story_v_out_114281", "114281001", "story_v_out_114281.awb") / 1000

					if var_4_60 + var_4_51 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_60 + var_4_51
					end

					if var_4_55.prefab_name ~= "" and arg_1_1.actors_[var_4_55.prefab_name] ~= nil then
						local var_4_61 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_55.prefab_name].transform, "story_v_out_114281", "114281001", "story_v_out_114281.awb")

						arg_1_1:RecordAudio("114281001", var_4_61)
						arg_1_1:RecordAudio("114281001", var_4_61)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_114281", "114281001", "story_v_out_114281.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_114281", "114281001", "story_v_out_114281.awb")
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
	Play114281002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 114281002
		arg_7_1.duration_ = 1.8

		local var_7_0 = {
			ja = 1.5,
			ko = 1.8,
			zh = 1.5,
			en = 1.766
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
				arg_7_0:Play114281003(arg_7_1)
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

				arg_7_1:CheckSpriteTmpPos("10017", 4)
			end

			local var_10_5 = 0.001

			if var_10_4 <= arg_7_1.time_ and arg_7_1.time_ < var_10_4 + var_10_5 then
				local var_10_6 = (arg_7_1.time_ - var_10_4) / var_10_5
				local var_10_7 = Vector3.New(390, -350, -180)

				var_10_3.localPosition = Vector3.Lerp(arg_7_1.var_.moveOldPos10017, var_10_7, var_10_6)
			end

			if arg_7_1.time_ >= var_10_4 + var_10_5 and arg_7_1.time_ < var_10_4 + var_10_5 + arg_10_0 then
				var_10_3.localPosition = Vector3.New(390, -350, -180)
			end

			local var_10_8 = arg_7_1.actors_["10022"]
			local var_10_9 = 0

			if var_10_9 < arg_7_1.time_ and arg_7_1.time_ <= var_10_9 + arg_10_0 and arg_7_1.var_.actorSpriteComps10022 == nil then
				arg_7_1.var_.actorSpriteComps10022 = var_10_8:GetComponentsInChildren(typeof(Image), true)
			end

			local var_10_10 = 0.034

			if var_10_9 <= arg_7_1.time_ and arg_7_1.time_ < var_10_9 + var_10_10 then
				local var_10_11 = (arg_7_1.time_ - var_10_9) / var_10_10

				if arg_7_1.var_.actorSpriteComps10022 then
					for iter_10_0, iter_10_1 in pairs(arg_7_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_10_1 then
							local var_10_12 = Mathf.Lerp(iter_10_1.color.r, 0.5, var_10_11)

							iter_10_1.color = Color.New(var_10_12, var_10_12, var_10_12)
						end
					end
				end
			end

			if arg_7_1.time_ >= var_10_9 + var_10_10 and arg_7_1.time_ < var_10_9 + var_10_10 + arg_10_0 and arg_7_1.var_.actorSpriteComps10022 then
				local var_10_13 = 0.5

				for iter_10_2, iter_10_3 in pairs(arg_7_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_10_3 then
						iter_10_3.color = Color.New(var_10_13, var_10_13, var_10_13)
					end
				end

				arg_7_1.var_.actorSpriteComps10022 = nil
			end

			local var_10_14 = arg_7_1.actors_["10017"]
			local var_10_15 = 0

			if var_10_15 < arg_7_1.time_ and arg_7_1.time_ <= var_10_15 + arg_10_0 then
				local var_10_16 = var_10_14:GetComponent("Image")

				if var_10_16 then
					arg_7_1.var_.highlightMatValue10017 = var_10_16
				end
			end

			local var_10_17 = 0.034

			if var_10_15 <= arg_7_1.time_ and arg_7_1.time_ < var_10_15 + var_10_17 then
				local var_10_18 = (arg_7_1.time_ - var_10_15) / var_10_17

				if arg_7_1.var_.highlightMatValue10017 then
					local var_10_19 = Mathf.Lerp(0.5, 1, var_10_18)
					local var_10_20 = arg_7_1.var_.highlightMatValue10017
					local var_10_21 = var_10_20.color

					var_10_21.r = var_10_19
					var_10_21.g = var_10_19
					var_10_21.b = var_10_19
					var_10_20.color = var_10_21
				end
			end

			if arg_7_1.time_ >= var_10_15 + var_10_17 and arg_7_1.time_ < var_10_15 + var_10_17 + arg_10_0 and arg_7_1.var_.highlightMatValue10017 then
				local var_10_22 = 1

				var_10_14.transform:SetSiblingIndex(1)

				local var_10_23 = arg_7_1.var_.highlightMatValue10017
				local var_10_24 = var_10_23.color

				var_10_24.r = var_10_22
				var_10_24.g = var_10_22
				var_10_24.b = var_10_22
				var_10_23.color = var_10_24
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
			local var_10_35 = 0.05

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

				local var_10_37 = arg_7_1:GetWordFromCfg(114281002)
				local var_10_38 = arg_7_1:FormatText(var_10_37.content)

				arg_7_1.text_.text = var_10_38

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_39 = 2
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

				if manager.audio:GetVoiceLength("story_v_out_114281", "114281002", "story_v_out_114281.awb") ~= 0 then
					local var_10_42 = manager.audio:GetVoiceLength("story_v_out_114281", "114281002", "story_v_out_114281.awb") / 1000

					if var_10_42 + var_10_34 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_42 + var_10_34
					end

					if var_10_37.prefab_name ~= "" and arg_7_1.actors_[var_10_37.prefab_name] ~= nil then
						local var_10_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_37.prefab_name].transform, "story_v_out_114281", "114281002", "story_v_out_114281.awb")

						arg_7_1:RecordAudio("114281002", var_10_43)
						arg_7_1:RecordAudio("114281002", var_10_43)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_114281", "114281002", "story_v_out_114281.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_114281", "114281002", "story_v_out_114281.awb")
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
	Play114281003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 114281003
		arg_11_1.duration_ = 10.6

		local var_11_0 = {
			ja = 10.6,
			ko = 6.9,
			zh = 7.6,
			en = 8.966
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
				arg_11_0:Play114281004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = arg_11_1.actors_["10022"]
			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 and arg_11_1.var_.actorSpriteComps10022 == nil then
				arg_11_1.var_.actorSpriteComps10022 = var_14_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_14_2 = 0.034

			if var_14_1 <= arg_11_1.time_ and arg_11_1.time_ < var_14_1 + var_14_2 then
				local var_14_3 = (arg_11_1.time_ - var_14_1) / var_14_2

				if arg_11_1.var_.actorSpriteComps10022 then
					for iter_14_0, iter_14_1 in pairs(arg_11_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_14_1 then
							local var_14_4 = Mathf.Lerp(iter_14_1.color.r, 1, var_14_3)

							iter_14_1.color = Color.New(var_14_4, var_14_4, var_14_4)
						end
					end
				end
			end

			if arg_11_1.time_ >= var_14_1 + var_14_2 and arg_11_1.time_ < var_14_1 + var_14_2 + arg_14_0 and arg_11_1.var_.actorSpriteComps10022 then
				local var_14_5 = 1

				for iter_14_2, iter_14_3 in pairs(arg_11_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_14_3 then
						iter_14_3.color = Color.New(var_14_5, var_14_5, var_14_5)
					end
				end

				arg_11_1.var_.actorSpriteComps10022 = nil
			end

			local var_14_6 = arg_11_1.actors_["10017"]
			local var_14_7 = 0

			if var_14_7 < arg_11_1.time_ and arg_11_1.time_ <= var_14_7 + arg_14_0 then
				local var_14_8 = var_14_6:GetComponent("Image")

				if var_14_8 then
					arg_11_1.var_.highlightMatValue10017 = var_14_8
				end
			end

			local var_14_9 = 0.034

			if var_14_7 <= arg_11_1.time_ and arg_11_1.time_ < var_14_7 + var_14_9 then
				local var_14_10 = (arg_11_1.time_ - var_14_7) / var_14_9

				if arg_11_1.var_.highlightMatValue10017 then
					local var_14_11 = Mathf.Lerp(1, 0.5, var_14_10)
					local var_14_12 = arg_11_1.var_.highlightMatValue10017
					local var_14_13 = var_14_12.color

					var_14_13.r = var_14_11
					var_14_13.g = var_14_11
					var_14_13.b = var_14_11
					var_14_12.color = var_14_13
				end
			end

			if arg_11_1.time_ >= var_14_7 + var_14_9 and arg_11_1.time_ < var_14_7 + var_14_9 + arg_14_0 and arg_11_1.var_.highlightMatValue10017 then
				local var_14_14 = 0.5
				local var_14_15 = arg_11_1.var_.highlightMatValue10017
				local var_14_16 = var_14_15.color

				var_14_16.r = var_14_14
				var_14_16.g = var_14_14
				var_14_16.b = var_14_14
				var_14_15.color = var_14_16
			end

			local var_14_17 = arg_11_1.actors_["10022"].transform
			local var_14_18 = 0

			if var_14_18 < arg_11_1.time_ and arg_11_1.time_ <= var_14_18 + arg_14_0 then
				arg_11_1.var_.moveOldPos10022 = var_14_17.localPosition
				var_14_17.localScale = Vector3.New(1, 1, 1)

				arg_11_1:CheckSpriteTmpPos("10022", 2)

				local var_14_19 = var_14_17.childCount

				for iter_14_4 = 0, var_14_19 - 1 do
					local var_14_20 = var_14_17:GetChild(iter_14_4)

					if var_14_20.name == "split_3" or not string.find(var_14_20.name, "split") then
						var_14_20.gameObject:SetActive(true)
					else
						var_14_20.gameObject:SetActive(false)
					end
				end
			end

			local var_14_21 = 0.001

			if var_14_18 <= arg_11_1.time_ and arg_11_1.time_ < var_14_18 + var_14_21 then
				local var_14_22 = (arg_11_1.time_ - var_14_18) / var_14_21
				local var_14_23 = Vector3.New(-390, -350, -180)

				var_14_17.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPos10022, var_14_23, var_14_22)
			end

			if arg_11_1.time_ >= var_14_18 + var_14_21 and arg_11_1.time_ < var_14_18 + var_14_21 + arg_14_0 then
				var_14_17.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_14_24 = 0
			local var_14_25 = 0.95

			if var_14_24 < arg_11_1.time_ and arg_11_1.time_ <= var_14_24 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_26 = arg_11_1:FormatText(StoryNameCfg[235].name)

				arg_11_1.leftNameTxt_.text = var_14_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_27 = arg_11_1:GetWordFromCfg(114281003)
				local var_14_28 = arg_11_1:FormatText(var_14_27.content)

				arg_11_1.text_.text = var_14_28

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_29 = 38
				local var_14_30 = utf8.len(var_14_28)
				local var_14_31 = var_14_29 <= 0 and var_14_25 or var_14_25 * (var_14_30 / var_14_29)

				if var_14_31 > 0 and var_14_25 < var_14_31 then
					arg_11_1.talkMaxDuration = var_14_31

					if var_14_31 + var_14_24 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_31 + var_14_24
					end
				end

				arg_11_1.text_.text = var_14_28
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114281", "114281003", "story_v_out_114281.awb") ~= 0 then
					local var_14_32 = manager.audio:GetVoiceLength("story_v_out_114281", "114281003", "story_v_out_114281.awb") / 1000

					if var_14_32 + var_14_24 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_32 + var_14_24
					end

					if var_14_27.prefab_name ~= "" and arg_11_1.actors_[var_14_27.prefab_name] ~= nil then
						local var_14_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_27.prefab_name].transform, "story_v_out_114281", "114281003", "story_v_out_114281.awb")

						arg_11_1:RecordAudio("114281003", var_14_33)
						arg_11_1:RecordAudio("114281003", var_14_33)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_114281", "114281003", "story_v_out_114281.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_114281", "114281003", "story_v_out_114281.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_34 = math.max(var_14_25, arg_11_1.talkMaxDuration)

			if var_14_24 <= arg_11_1.time_ and arg_11_1.time_ < var_14_24 + var_14_34 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_24) / var_14_34

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_24 + var_14_34 and arg_11_1.time_ < var_14_24 + var_14_34 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play114281004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 114281004
		arg_15_1.duration_ = 6.1

		local var_15_0 = {
			ja = 4.8,
			ko = 5.133,
			zh = 6.1,
			en = 4.7
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
				arg_15_0:Play114281005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = arg_15_1.actors_["10022"]
			local var_18_1 = 0

			if var_18_1 < arg_15_1.time_ and arg_15_1.time_ <= var_18_1 + arg_18_0 and arg_15_1.var_.actorSpriteComps10022 == nil then
				arg_15_1.var_.actorSpriteComps10022 = var_18_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_18_2 = 0.034

			if var_18_1 <= arg_15_1.time_ and arg_15_1.time_ < var_18_1 + var_18_2 then
				local var_18_3 = (arg_15_1.time_ - var_18_1) / var_18_2

				if arg_15_1.var_.actorSpriteComps10022 then
					for iter_18_0, iter_18_1 in pairs(arg_15_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_18_1 then
							local var_18_4 = Mathf.Lerp(iter_18_1.color.r, 0.5, var_18_3)

							iter_18_1.color = Color.New(var_18_4, var_18_4, var_18_4)
						end
					end
				end
			end

			if arg_15_1.time_ >= var_18_1 + var_18_2 and arg_15_1.time_ < var_18_1 + var_18_2 + arg_18_0 and arg_15_1.var_.actorSpriteComps10022 then
				local var_18_5 = 0.5

				for iter_18_2, iter_18_3 in pairs(arg_15_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_18_3 then
						iter_18_3.color = Color.New(var_18_5, var_18_5, var_18_5)
					end
				end

				arg_15_1.var_.actorSpriteComps10022 = nil
			end

			local var_18_6 = arg_15_1.actors_["10017"]
			local var_18_7 = 0

			if var_18_7 < arg_15_1.time_ and arg_15_1.time_ <= var_18_7 + arg_18_0 then
				local var_18_8 = var_18_6:GetComponent("Image")

				if var_18_8 then
					arg_15_1.var_.highlightMatValue10017 = var_18_8
				end
			end

			local var_18_9 = 0.034

			if var_18_7 <= arg_15_1.time_ and arg_15_1.time_ < var_18_7 + var_18_9 then
				local var_18_10 = (arg_15_1.time_ - var_18_7) / var_18_9

				if arg_15_1.var_.highlightMatValue10017 then
					local var_18_11 = Mathf.Lerp(0.5, 1, var_18_10)
					local var_18_12 = arg_15_1.var_.highlightMatValue10017
					local var_18_13 = var_18_12.color

					var_18_13.r = var_18_11
					var_18_13.g = var_18_11
					var_18_13.b = var_18_11
					var_18_12.color = var_18_13
				end
			end

			if arg_15_1.time_ >= var_18_7 + var_18_9 and arg_15_1.time_ < var_18_7 + var_18_9 + arg_18_0 and arg_15_1.var_.highlightMatValue10017 then
				local var_18_14 = 1

				var_18_6.transform:SetSiblingIndex(1)

				local var_18_15 = arg_15_1.var_.highlightMatValue10017
				local var_18_16 = var_18_15.color

				var_18_16.r = var_18_14
				var_18_16.g = var_18_14
				var_18_16.b = var_18_14
				var_18_15.color = var_18_16
			end

			local var_18_17 = 0
			local var_18_18 = 0.65

			if var_18_17 < arg_15_1.time_ and arg_15_1.time_ <= var_18_17 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_19 = arg_15_1:FormatText(StoryNameCfg[255].name)

				arg_15_1.leftNameTxt_.text = var_18_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_20 = arg_15_1:GetWordFromCfg(114281004)
				local var_18_21 = arg_15_1:FormatText(var_18_20.content)

				arg_15_1.text_.text = var_18_21

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_22 = 26
				local var_18_23 = utf8.len(var_18_21)
				local var_18_24 = var_18_22 <= 0 and var_18_18 or var_18_18 * (var_18_23 / var_18_22)

				if var_18_24 > 0 and var_18_18 < var_18_24 then
					arg_15_1.talkMaxDuration = var_18_24

					if var_18_24 + var_18_17 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_24 + var_18_17
					end
				end

				arg_15_1.text_.text = var_18_21
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114281", "114281004", "story_v_out_114281.awb") ~= 0 then
					local var_18_25 = manager.audio:GetVoiceLength("story_v_out_114281", "114281004", "story_v_out_114281.awb") / 1000

					if var_18_25 + var_18_17 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_25 + var_18_17
					end

					if var_18_20.prefab_name ~= "" and arg_15_1.actors_[var_18_20.prefab_name] ~= nil then
						local var_18_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_20.prefab_name].transform, "story_v_out_114281", "114281004", "story_v_out_114281.awb")

						arg_15_1:RecordAudio("114281004", var_18_26)
						arg_15_1:RecordAudio("114281004", var_18_26)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_114281", "114281004", "story_v_out_114281.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_114281", "114281004", "story_v_out_114281.awb")
				end

				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_27 = math.max(var_18_18, arg_15_1.talkMaxDuration)

			if var_18_17 <= arg_15_1.time_ and arg_15_1.time_ < var_18_17 + var_18_27 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_17) / var_18_27

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_17 + var_18_27 and arg_15_1.time_ < var_18_17 + var_18_27 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play114281005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 114281005
		arg_19_1.duration_ = 5

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play114281006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = arg_19_1.actors_["10017"]
			local var_22_1 = 0

			if var_22_1 < arg_19_1.time_ and arg_19_1.time_ <= var_22_1 + arg_22_0 then
				local var_22_2 = var_22_0:GetComponent("Image")

				if var_22_2 then
					arg_19_1.var_.highlightMatValue10017 = var_22_2
				end
			end

			local var_22_3 = 0.034

			if var_22_1 <= arg_19_1.time_ and arg_19_1.time_ < var_22_1 + var_22_3 then
				local var_22_4 = (arg_19_1.time_ - var_22_1) / var_22_3

				if arg_19_1.var_.highlightMatValue10017 then
					local var_22_5 = Mathf.Lerp(1, 0.5, var_22_4)
					local var_22_6 = arg_19_1.var_.highlightMatValue10017
					local var_22_7 = var_22_6.color

					var_22_7.r = var_22_5
					var_22_7.g = var_22_5
					var_22_7.b = var_22_5
					var_22_6.color = var_22_7
				end
			end

			if arg_19_1.time_ >= var_22_1 + var_22_3 and arg_19_1.time_ < var_22_1 + var_22_3 + arg_22_0 and arg_19_1.var_.highlightMatValue10017 then
				local var_22_8 = 0.5
				local var_22_9 = arg_19_1.var_.highlightMatValue10017
				local var_22_10 = var_22_9.color

				var_22_10.r = var_22_8
				var_22_10.g = var_22_8
				var_22_10.b = var_22_8
				var_22_9.color = var_22_10
			end

			local var_22_11 = 0
			local var_22_12 = 1.275

			if var_22_11 < arg_19_1.time_ and arg_19_1.time_ <= var_22_11 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, false)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_13 = arg_19_1:GetWordFromCfg(114281005)
				local var_22_14 = arg_19_1:FormatText(var_22_13.content)

				arg_19_1.text_.text = var_22_14

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_15 = 50
				local var_22_16 = utf8.len(var_22_14)
				local var_22_17 = var_22_15 <= 0 and var_22_12 or var_22_12 * (var_22_16 / var_22_15)

				if var_22_17 > 0 and var_22_12 < var_22_17 then
					arg_19_1.talkMaxDuration = var_22_17

					if var_22_17 + var_22_11 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_17 + var_22_11
					end
				end

				arg_19_1.text_.text = var_22_14
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)
				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_18 = math.max(var_22_12, arg_19_1.talkMaxDuration)

			if var_22_11 <= arg_19_1.time_ and arg_19_1.time_ < var_22_11 + var_22_18 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_11) / var_22_18

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_11 + var_22_18 and arg_19_1.time_ < var_22_11 + var_22_18 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play114281006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 114281006
		arg_23_1.duration_ = 10.733

		local var_23_0 = {
			ja = 10.733,
			ko = 10.066,
			zh = 9.133,
			en = 8.666
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
				arg_23_0:Play114281007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["10022"].transform
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 then
				arg_23_1.var_.moveOldPos10022 = var_26_0.localPosition
				var_26_0.localScale = Vector3.New(1, 1, 1)

				arg_23_1:CheckSpriteTmpPos("10022", 2)

				local var_26_2 = var_26_0.childCount

				for iter_26_0 = 0, var_26_2 - 1 do
					local var_26_3 = var_26_0:GetChild(iter_26_0)

					if var_26_3.name == "split_3" or not string.find(var_26_3.name, "split") then
						var_26_3.gameObject:SetActive(true)
					else
						var_26_3.gameObject:SetActive(false)
					end
				end
			end

			local var_26_4 = 0.001

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_4 then
				local var_26_5 = (arg_23_1.time_ - var_26_1) / var_26_4
				local var_26_6 = Vector3.New(-390, -350, -180)

				var_26_0.localPosition = Vector3.Lerp(arg_23_1.var_.moveOldPos10022, var_26_6, var_26_5)
			end

			if arg_23_1.time_ >= var_26_1 + var_26_4 and arg_23_1.time_ < var_26_1 + var_26_4 + arg_26_0 then
				var_26_0.localPosition = Vector3.New(-390, -350, -180)
			end

			local var_26_7 = arg_23_1.actors_["10022"]
			local var_26_8 = 0

			if var_26_8 < arg_23_1.time_ and arg_23_1.time_ <= var_26_8 + arg_26_0 and arg_23_1.var_.actorSpriteComps10022 == nil then
				arg_23_1.var_.actorSpriteComps10022 = var_26_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_26_9 = 0.034

			if var_26_8 <= arg_23_1.time_ and arg_23_1.time_ < var_26_8 + var_26_9 then
				local var_26_10 = (arg_23_1.time_ - var_26_8) / var_26_9

				if arg_23_1.var_.actorSpriteComps10022 then
					for iter_26_1, iter_26_2 in pairs(arg_23_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_26_2 then
							local var_26_11 = Mathf.Lerp(iter_26_2.color.r, 1, var_26_10)

							iter_26_2.color = Color.New(var_26_11, var_26_11, var_26_11)
						end
					end
				end
			end

			if arg_23_1.time_ >= var_26_8 + var_26_9 and arg_23_1.time_ < var_26_8 + var_26_9 + arg_26_0 and arg_23_1.var_.actorSpriteComps10022 then
				local var_26_12 = 1

				for iter_26_3, iter_26_4 in pairs(arg_23_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_26_4 then
						iter_26_4.color = Color.New(var_26_12, var_26_12, var_26_12)
					end
				end

				arg_23_1.var_.actorSpriteComps10022 = nil
			end

			local var_26_13 = 0
			local var_26_14 = 1.125

			if var_26_13 < arg_23_1.time_ and arg_23_1.time_ <= var_26_13 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_15 = arg_23_1:FormatText(StoryNameCfg[235].name)

				arg_23_1.leftNameTxt_.text = var_26_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_16 = arg_23_1:GetWordFromCfg(114281006)
				local var_26_17 = arg_23_1:FormatText(var_26_16.content)

				arg_23_1.text_.text = var_26_17

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_18 = 45
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

				if manager.audio:GetVoiceLength("story_v_out_114281", "114281006", "story_v_out_114281.awb") ~= 0 then
					local var_26_21 = manager.audio:GetVoiceLength("story_v_out_114281", "114281006", "story_v_out_114281.awb") / 1000

					if var_26_21 + var_26_13 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_21 + var_26_13
					end

					if var_26_16.prefab_name ~= "" and arg_23_1.actors_[var_26_16.prefab_name] ~= nil then
						local var_26_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_16.prefab_name].transform, "story_v_out_114281", "114281006", "story_v_out_114281.awb")

						arg_23_1:RecordAudio("114281006", var_26_22)
						arg_23_1:RecordAudio("114281006", var_26_22)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_114281", "114281006", "story_v_out_114281.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_114281", "114281006", "story_v_out_114281.awb")
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
	Play114281007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 114281007
		arg_27_1.duration_ = 4.833

		local var_27_0 = {
			ja = 4.533,
			ko = 4.833,
			zh = 2.733,
			en = 3.2
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
				arg_27_0:Play114281008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = arg_27_1.actors_["10022"]
			local var_30_1 = 0

			if var_30_1 < arg_27_1.time_ and arg_27_1.time_ <= var_30_1 + arg_30_0 and arg_27_1.var_.actorSpriteComps10022 == nil then
				arg_27_1.var_.actorSpriteComps10022 = var_30_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_30_2 = 0.034

			if var_30_1 <= arg_27_1.time_ and arg_27_1.time_ < var_30_1 + var_30_2 then
				local var_30_3 = (arg_27_1.time_ - var_30_1) / var_30_2

				if arg_27_1.var_.actorSpriteComps10022 then
					for iter_30_0, iter_30_1 in pairs(arg_27_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_30_1 then
							local var_30_4 = Mathf.Lerp(iter_30_1.color.r, 0.5, var_30_3)

							iter_30_1.color = Color.New(var_30_4, var_30_4, var_30_4)
						end
					end
				end
			end

			if arg_27_1.time_ >= var_30_1 + var_30_2 and arg_27_1.time_ < var_30_1 + var_30_2 + arg_30_0 and arg_27_1.var_.actorSpriteComps10022 then
				local var_30_5 = 0.5

				for iter_30_2, iter_30_3 in pairs(arg_27_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_30_3 then
						iter_30_3.color = Color.New(var_30_5, var_30_5, var_30_5)
					end
				end

				arg_27_1.var_.actorSpriteComps10022 = nil
			end

			local var_30_6 = arg_27_1.actors_["10017"]
			local var_30_7 = 0

			if var_30_7 < arg_27_1.time_ and arg_27_1.time_ <= var_30_7 + arg_30_0 then
				local var_30_8 = var_30_6:GetComponent("Image")

				if var_30_8 then
					arg_27_1.var_.highlightMatValue10017 = var_30_8
				end
			end

			local var_30_9 = 0.034

			if var_30_7 <= arg_27_1.time_ and arg_27_1.time_ < var_30_7 + var_30_9 then
				local var_30_10 = (arg_27_1.time_ - var_30_7) / var_30_9

				if arg_27_1.var_.highlightMatValue10017 then
					local var_30_11 = Mathf.Lerp(0.5, 1, var_30_10)
					local var_30_12 = arg_27_1.var_.highlightMatValue10017
					local var_30_13 = var_30_12.color

					var_30_13.r = var_30_11
					var_30_13.g = var_30_11
					var_30_13.b = var_30_11
					var_30_12.color = var_30_13
				end
			end

			if arg_27_1.time_ >= var_30_7 + var_30_9 and arg_27_1.time_ < var_30_7 + var_30_9 + arg_30_0 and arg_27_1.var_.highlightMatValue10017 then
				local var_30_14 = 1

				var_30_6.transform:SetSiblingIndex(1)

				local var_30_15 = arg_27_1.var_.highlightMatValue10017
				local var_30_16 = var_30_15.color

				var_30_16.r = var_30_14
				var_30_16.g = var_30_14
				var_30_16.b = var_30_14
				var_30_15.color = var_30_16
			end

			local var_30_17 = 0
			local var_30_18 = 0.35

			if var_30_17 < arg_27_1.time_ and arg_27_1.time_ <= var_30_17 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_19 = arg_27_1:FormatText(StoryNameCfg[255].name)

				arg_27_1.leftNameTxt_.text = var_30_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_20 = arg_27_1:GetWordFromCfg(114281007)
				local var_30_21 = arg_27_1:FormatText(var_30_20.content)

				arg_27_1.text_.text = var_30_21

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_22 = 14
				local var_30_23 = utf8.len(var_30_21)
				local var_30_24 = var_30_22 <= 0 and var_30_18 or var_30_18 * (var_30_23 / var_30_22)

				if var_30_24 > 0 and var_30_18 < var_30_24 then
					arg_27_1.talkMaxDuration = var_30_24

					if var_30_24 + var_30_17 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_24 + var_30_17
					end
				end

				arg_27_1.text_.text = var_30_21
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114281", "114281007", "story_v_out_114281.awb") ~= 0 then
					local var_30_25 = manager.audio:GetVoiceLength("story_v_out_114281", "114281007", "story_v_out_114281.awb") / 1000

					if var_30_25 + var_30_17 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_25 + var_30_17
					end

					if var_30_20.prefab_name ~= "" and arg_27_1.actors_[var_30_20.prefab_name] ~= nil then
						local var_30_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_20.prefab_name].transform, "story_v_out_114281", "114281007", "story_v_out_114281.awb")

						arg_27_1:RecordAudio("114281007", var_30_26)
						arg_27_1:RecordAudio("114281007", var_30_26)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_114281", "114281007", "story_v_out_114281.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_114281", "114281007", "story_v_out_114281.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_27 = math.max(var_30_18, arg_27_1.talkMaxDuration)

			if var_30_17 <= arg_27_1.time_ and arg_27_1.time_ < var_30_17 + var_30_27 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_17) / var_30_27

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_17 + var_30_27 and arg_27_1.time_ < var_30_17 + var_30_27 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play114281008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 114281008
		arg_31_1.duration_ = 7.433

		local var_31_0 = {
			ja = 7.433,
			ko = 6.1,
			zh = 4.466,
			en = 5.7
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
				arg_31_0:Play114281009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["10022"]
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 and arg_31_1.var_.actorSpriteComps10022 == nil then
				arg_31_1.var_.actorSpriteComps10022 = var_34_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_34_2 = 0.034

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2

				if arg_31_1.var_.actorSpriteComps10022 then
					for iter_34_0, iter_34_1 in pairs(arg_31_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_34_1 then
							local var_34_4 = Mathf.Lerp(iter_34_1.color.r, 1, var_34_3)

							iter_34_1.color = Color.New(var_34_4, var_34_4, var_34_4)
						end
					end
				end
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 and arg_31_1.var_.actorSpriteComps10022 then
				local var_34_5 = 1

				for iter_34_2, iter_34_3 in pairs(arg_31_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_34_3 then
						iter_34_3.color = Color.New(var_34_5, var_34_5, var_34_5)
					end
				end

				arg_31_1.var_.actorSpriteComps10022 = nil
			end

			local var_34_6 = arg_31_1.actors_["10017"]
			local var_34_7 = 0

			if var_34_7 < arg_31_1.time_ and arg_31_1.time_ <= var_34_7 + arg_34_0 then
				local var_34_8 = var_34_6:GetComponent("Image")

				if var_34_8 then
					arg_31_1.var_.highlightMatValue10017 = var_34_8
				end
			end

			local var_34_9 = 0.034

			if var_34_7 <= arg_31_1.time_ and arg_31_1.time_ < var_34_7 + var_34_9 then
				local var_34_10 = (arg_31_1.time_ - var_34_7) / var_34_9

				if arg_31_1.var_.highlightMatValue10017 then
					local var_34_11 = Mathf.Lerp(1, 0.5, var_34_10)
					local var_34_12 = arg_31_1.var_.highlightMatValue10017
					local var_34_13 = var_34_12.color

					var_34_13.r = var_34_11
					var_34_13.g = var_34_11
					var_34_13.b = var_34_11
					var_34_12.color = var_34_13
				end
			end

			if arg_31_1.time_ >= var_34_7 + var_34_9 and arg_31_1.time_ < var_34_7 + var_34_9 + arg_34_0 and arg_31_1.var_.highlightMatValue10017 then
				local var_34_14 = 0.5
				local var_34_15 = arg_31_1.var_.highlightMatValue10017
				local var_34_16 = var_34_15.color

				var_34_16.r = var_34_14
				var_34_16.g = var_34_14
				var_34_16.b = var_34_14
				var_34_15.color = var_34_16
			end

			local var_34_17 = manager.ui.mainCamera.transform
			local var_34_18 = 0

			if var_34_18 < arg_31_1.time_ and arg_31_1.time_ <= var_34_18 + arg_34_0 then
				arg_31_1.var_.shakeOldPos = var_34_17.localPosition
			end

			local var_34_19 = 0.6

			if var_34_18 <= arg_31_1.time_ and arg_31_1.time_ < var_34_18 + var_34_19 then
				local var_34_20 = (arg_31_1.time_ - var_34_18) / 0.066
				local var_34_21, var_34_22 = math.modf(var_34_20)

				var_34_17.localPosition = Vector3.New(var_34_22 * 0.13, var_34_22 * 0.13, var_34_22 * 0.13) + arg_31_1.var_.shakeOldPos
			end

			if arg_31_1.time_ >= var_34_18 + var_34_19 and arg_31_1.time_ < var_34_18 + var_34_19 + arg_34_0 then
				var_34_17.localPosition = arg_31_1.var_.shakeOldPos
			end

			local var_34_23 = 0

			if var_34_23 < arg_31_1.time_ and arg_31_1.time_ <= var_34_23 + arg_34_0 then
				arg_31_1.allBtn_.enabled = false
			end

			local var_34_24 = 0.6

			if arg_31_1.time_ >= var_34_23 + var_34_24 and arg_31_1.time_ < var_34_23 + var_34_24 + arg_34_0 then
				arg_31_1.allBtn_.enabled = true
			end

			local var_34_25 = 0
			local var_34_26 = 0.6

			if var_34_25 < arg_31_1.time_ and arg_31_1.time_ <= var_34_25 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_27 = arg_31_1:FormatText(StoryNameCfg[235].name)

				arg_31_1.leftNameTxt_.text = var_34_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_28 = arg_31_1:GetWordFromCfg(114281008)
				local var_34_29 = arg_31_1:FormatText(var_34_28.content)

				arg_31_1.text_.text = var_34_29

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_30 = 24
				local var_34_31 = utf8.len(var_34_29)
				local var_34_32 = var_34_30 <= 0 and var_34_26 or var_34_26 * (var_34_31 / var_34_30)

				if var_34_32 > 0 and var_34_26 < var_34_32 then
					arg_31_1.talkMaxDuration = var_34_32

					if var_34_32 + var_34_25 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_32 + var_34_25
					end
				end

				arg_31_1.text_.text = var_34_29
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114281", "114281008", "story_v_out_114281.awb") ~= 0 then
					local var_34_33 = manager.audio:GetVoiceLength("story_v_out_114281", "114281008", "story_v_out_114281.awb") / 1000

					if var_34_33 + var_34_25 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_33 + var_34_25
					end

					if var_34_28.prefab_name ~= "" and arg_31_1.actors_[var_34_28.prefab_name] ~= nil then
						local var_34_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_28.prefab_name].transform, "story_v_out_114281", "114281008", "story_v_out_114281.awb")

						arg_31_1:RecordAudio("114281008", var_34_34)
						arg_31_1:RecordAudio("114281008", var_34_34)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_114281", "114281008", "story_v_out_114281.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_114281", "114281008", "story_v_out_114281.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_35 = math.max(var_34_26, arg_31_1.talkMaxDuration)

			if var_34_25 <= arg_31_1.time_ and arg_31_1.time_ < var_34_25 + var_34_35 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_25) / var_34_35

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_25 + var_34_35 and arg_31_1.time_ < var_34_25 + var_34_35 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play114281009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 114281009
		arg_35_1.duration_ = 1.633

		local var_35_0 = {
			ja = 1.633,
			ko = 1.266,
			zh = 0.999999999999,
			en = 1.1
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
				arg_35_0:Play114281010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["10022"]
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 and arg_35_1.var_.actorSpriteComps10022 == nil then
				arg_35_1.var_.actorSpriteComps10022 = var_38_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_38_2 = 0.034

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2

				if arg_35_1.var_.actorSpriteComps10022 then
					for iter_38_0, iter_38_1 in pairs(arg_35_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_38_1 then
							local var_38_4 = Mathf.Lerp(iter_38_1.color.r, 0.5, var_38_3)

							iter_38_1.color = Color.New(var_38_4, var_38_4, var_38_4)
						end
					end
				end
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 and arg_35_1.var_.actorSpriteComps10022 then
				local var_38_5 = 0.5

				for iter_38_2, iter_38_3 in pairs(arg_35_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_38_3 then
						iter_38_3.color = Color.New(var_38_5, var_38_5, var_38_5)
					end
				end

				arg_35_1.var_.actorSpriteComps10022 = nil
			end

			local var_38_6 = arg_35_1.actors_["10017"]
			local var_38_7 = 0

			if var_38_7 < arg_35_1.time_ and arg_35_1.time_ <= var_38_7 + arg_38_0 then
				local var_38_8 = var_38_6:GetComponent("Image")

				if var_38_8 then
					arg_35_1.var_.highlightMatValue10017 = var_38_8
				end
			end

			local var_38_9 = 0.034

			if var_38_7 <= arg_35_1.time_ and arg_35_1.time_ < var_38_7 + var_38_9 then
				local var_38_10 = (arg_35_1.time_ - var_38_7) / var_38_9

				if arg_35_1.var_.highlightMatValue10017 then
					local var_38_11 = Mathf.Lerp(0.5, 1, var_38_10)
					local var_38_12 = arg_35_1.var_.highlightMatValue10017
					local var_38_13 = var_38_12.color

					var_38_13.r = var_38_11
					var_38_13.g = var_38_11
					var_38_13.b = var_38_11
					var_38_12.color = var_38_13
				end
			end

			if arg_35_1.time_ >= var_38_7 + var_38_9 and arg_35_1.time_ < var_38_7 + var_38_9 + arg_38_0 and arg_35_1.var_.highlightMatValue10017 then
				local var_38_14 = 1

				var_38_6.transform:SetSiblingIndex(1)

				local var_38_15 = arg_35_1.var_.highlightMatValue10017
				local var_38_16 = var_38_15.color

				var_38_16.r = var_38_14
				var_38_16.g = var_38_14
				var_38_16.b = var_38_14
				var_38_15.color = var_38_16
			end

			local var_38_17 = 0
			local var_38_18 = 0.05

			if var_38_17 < arg_35_1.time_ and arg_35_1.time_ <= var_38_17 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_19 = arg_35_1:FormatText(StoryNameCfg[255].name)

				arg_35_1.leftNameTxt_.text = var_38_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_20 = arg_35_1:GetWordFromCfg(114281009)
				local var_38_21 = arg_35_1:FormatText(var_38_20.content)

				arg_35_1.text_.text = var_38_21

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_22 = 2
				local var_38_23 = utf8.len(var_38_21)
				local var_38_24 = var_38_22 <= 0 and var_38_18 or var_38_18 * (var_38_23 / var_38_22)

				if var_38_24 > 0 and var_38_18 < var_38_24 then
					arg_35_1.talkMaxDuration = var_38_24

					if var_38_24 + var_38_17 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_24 + var_38_17
					end
				end

				arg_35_1.text_.text = var_38_21
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114281", "114281009", "story_v_out_114281.awb") ~= 0 then
					local var_38_25 = manager.audio:GetVoiceLength("story_v_out_114281", "114281009", "story_v_out_114281.awb") / 1000

					if var_38_25 + var_38_17 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_25 + var_38_17
					end

					if var_38_20.prefab_name ~= "" and arg_35_1.actors_[var_38_20.prefab_name] ~= nil then
						local var_38_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_20.prefab_name].transform, "story_v_out_114281", "114281009", "story_v_out_114281.awb")

						arg_35_1:RecordAudio("114281009", var_38_26)
						arg_35_1:RecordAudio("114281009", var_38_26)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_114281", "114281009", "story_v_out_114281.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_114281", "114281009", "story_v_out_114281.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_27 = math.max(var_38_18, arg_35_1.talkMaxDuration)

			if var_38_17 <= arg_35_1.time_ and arg_35_1.time_ < var_38_17 + var_38_27 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_17) / var_38_27

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_17 + var_38_27 and arg_35_1.time_ < var_38_17 + var_38_27 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play114281010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 114281010
		arg_39_1.duration_ = 11.666

		local var_39_0 = {
			ja = 11.233,
			ko = 11.233,
			zh = 11.666,
			en = 9.766
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
				arg_39_0:Play114281011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = 0
			local var_42_1 = 1.3

			if var_42_0 < arg_39_1.time_ and arg_39_1.time_ <= var_42_0 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_2 = arg_39_1:FormatText(StoryNameCfg[255].name)

				arg_39_1.leftNameTxt_.text = var_42_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_3 = arg_39_1:GetWordFromCfg(114281010)
				local var_42_4 = arg_39_1:FormatText(var_42_3.content)

				arg_39_1.text_.text = var_42_4

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_5 = 52
				local var_42_6 = utf8.len(var_42_4)
				local var_42_7 = var_42_5 <= 0 and var_42_1 or var_42_1 * (var_42_6 / var_42_5)

				if var_42_7 > 0 and var_42_1 < var_42_7 then
					arg_39_1.talkMaxDuration = var_42_7

					if var_42_7 + var_42_0 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_7 + var_42_0
					end
				end

				arg_39_1.text_.text = var_42_4
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114281", "114281010", "story_v_out_114281.awb") ~= 0 then
					local var_42_8 = manager.audio:GetVoiceLength("story_v_out_114281", "114281010", "story_v_out_114281.awb") / 1000

					if var_42_8 + var_42_0 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_8 + var_42_0
					end

					if var_42_3.prefab_name ~= "" and arg_39_1.actors_[var_42_3.prefab_name] ~= nil then
						local var_42_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_3.prefab_name].transform, "story_v_out_114281", "114281010", "story_v_out_114281.awb")

						arg_39_1:RecordAudio("114281010", var_42_9)
						arg_39_1:RecordAudio("114281010", var_42_9)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_114281", "114281010", "story_v_out_114281.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_114281", "114281010", "story_v_out_114281.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_10 = math.max(var_42_1, arg_39_1.talkMaxDuration)

			if var_42_0 <= arg_39_1.time_ and arg_39_1.time_ < var_42_0 + var_42_10 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_0) / var_42_10

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_0 + var_42_10 and arg_39_1.time_ < var_42_0 + var_42_10 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play114281011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 114281011
		arg_43_1.duration_ = 6.933

		local var_43_0 = {
			ja = 6.933,
			ko = 4.3,
			zh = 5,
			en = 4.5
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
			arg_43_1.auto_ = false
		end

		function arg_43_1.playNext_(arg_45_0)
			arg_43_1.onStoryFinished_()
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["10022"]
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 and arg_43_1.var_.actorSpriteComps10022 == nil then
				arg_43_1.var_.actorSpriteComps10022 = var_46_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_46_2 = 0.034

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2

				if arg_43_1.var_.actorSpriteComps10022 then
					for iter_46_0, iter_46_1 in pairs(arg_43_1.var_.actorSpriteComps10022:ToTable()) do
						if iter_46_1 then
							local var_46_4 = Mathf.Lerp(iter_46_1.color.r, 1, var_46_3)

							iter_46_1.color = Color.New(var_46_4, var_46_4, var_46_4)
						end
					end
				end
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 and arg_43_1.var_.actorSpriteComps10022 then
				local var_46_5 = 1

				for iter_46_2, iter_46_3 in pairs(arg_43_1.var_.actorSpriteComps10022:ToTable()) do
					if iter_46_3 then
						iter_46_3.color = Color.New(var_46_5, var_46_5, var_46_5)
					end
				end

				arg_43_1.var_.actorSpriteComps10022 = nil
			end

			local var_46_6 = arg_43_1.actors_["10017"]
			local var_46_7 = 0

			if var_46_7 < arg_43_1.time_ and arg_43_1.time_ <= var_46_7 + arg_46_0 then
				local var_46_8 = var_46_6:GetComponent("Image")

				if var_46_8 then
					arg_43_1.var_.highlightMatValue10017 = var_46_8
				end
			end

			local var_46_9 = 0.034

			if var_46_7 <= arg_43_1.time_ and arg_43_1.time_ < var_46_7 + var_46_9 then
				local var_46_10 = (arg_43_1.time_ - var_46_7) / var_46_9

				if arg_43_1.var_.highlightMatValue10017 then
					local var_46_11 = Mathf.Lerp(1, 0.5, var_46_10)
					local var_46_12 = arg_43_1.var_.highlightMatValue10017
					local var_46_13 = var_46_12.color

					var_46_13.r = var_46_11
					var_46_13.g = var_46_11
					var_46_13.b = var_46_11
					var_46_12.color = var_46_13
				end
			end

			if arg_43_1.time_ >= var_46_7 + var_46_9 and arg_43_1.time_ < var_46_7 + var_46_9 + arg_46_0 and arg_43_1.var_.highlightMatValue10017 then
				local var_46_14 = 0.5
				local var_46_15 = arg_43_1.var_.highlightMatValue10017
				local var_46_16 = var_46_15.color

				var_46_16.r = var_46_14
				var_46_16.g = var_46_14
				var_46_16.b = var_46_14
				var_46_15.color = var_46_16
			end

			local var_46_17 = 0
			local var_46_18 = 0.525

			if var_46_17 < arg_43_1.time_ and arg_43_1.time_ <= var_46_17 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_19 = arg_43_1:FormatText(StoryNameCfg[235].name)

				arg_43_1.leftNameTxt_.text = var_46_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_20 = arg_43_1:GetWordFromCfg(114281011)
				local var_46_21 = arg_43_1:FormatText(var_46_20.content)

				arg_43_1.text_.text = var_46_21

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_22 = 21
				local var_46_23 = utf8.len(var_46_21)
				local var_46_24 = var_46_22 <= 0 and var_46_18 or var_46_18 * (var_46_23 / var_46_22)

				if var_46_24 > 0 and var_46_18 < var_46_24 then
					arg_43_1.talkMaxDuration = var_46_24

					if var_46_24 + var_46_17 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_24 + var_46_17
					end
				end

				arg_43_1.text_.text = var_46_21
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_114281", "114281011", "story_v_out_114281.awb") ~= 0 then
					local var_46_25 = manager.audio:GetVoiceLength("story_v_out_114281", "114281011", "story_v_out_114281.awb") / 1000

					if var_46_25 + var_46_17 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_25 + var_46_17
					end

					if var_46_20.prefab_name ~= "" and arg_43_1.actors_[var_46_20.prefab_name] ~= nil then
						local var_46_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_20.prefab_name].transform, "story_v_out_114281", "114281011", "story_v_out_114281.awb")

						arg_43_1:RecordAudio("114281011", var_46_26)
						arg_43_1:RecordAudio("114281011", var_46_26)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_114281", "114281011", "story_v_out_114281.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_114281", "114281011", "story_v_out_114281.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_27 = math.max(var_46_18, arg_43_1.talkMaxDuration)

			if var_46_17 <= arg_43_1.time_ and arg_43_1.time_ < var_46_17 + var_46_27 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_17) / var_46_27

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_17 + var_46_27 and arg_43_1.time_ < var_46_17 + var_46_27 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/F04"
	},
	voices = {
		"story_v_out_114281.awb"
	}
}
